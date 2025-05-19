{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-avestan-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansavestan/NotoSansAvestan-Regular.ttf?raw=true";
      name = "NotoSansAvestan-Regular.ttf";
      sha256 = "fe2ed44b8b3949cddced6c748bb67e161727b133d1e7a67c20385b314d2a4158";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansAvestan-Regular.ttf $out/share/fonts/truetype/NotoSansAvestan-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Avestan";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
