{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "short-stack-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/shortstack/ShortStack-Regular.ttf?raw=true";
      name = "ShortStack-Regular.ttf";
      sha256 = "9f0e16e8683b2dce66edd7c3340362b554326739fbac594cabc1e9442cf5e8cc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ShortStack-Regular.ttf $out/share/fonts/truetype/ShortStack-Regular.ttf
  '';

  meta = with lib; {
    description = "Short Stack";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
