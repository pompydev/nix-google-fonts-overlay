{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "padauk-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fab83f4bec30374b922992db6ee7d3618fd60f17/ofl/padauk/Padauk-Regular.ttf?raw=true";
      name = "Padauk-Regular.ttf";
      sha256 = "2f767c6978439ba4b7262d2239bbc2efd8ab27f8c9ffddb3dcf7d3c54f347b46";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fab83f4bec30374b922992db6ee7d3618fd60f17/ofl/padauk/Padauk-Bold.ttf?raw=true";
      name = "Padauk-Bold.ttf";
      sha256 = "e1e641fb70a7fa0c1e36c1bd761d66938a9a8391faaea5e16aa55b3362a9f924";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Padauk-Regular.ttf $out/share/fonts/truetype/Padauk-Regular.ttf
     install -Dm644 Padauk-Bold.ttf $out/share/fonts/truetype/Padauk-Bold.ttf
  '';

  meta = with lib; {
    description = "Padauk";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
