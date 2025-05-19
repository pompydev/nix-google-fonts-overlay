{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jua-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/jua/Jua-Regular.ttf?raw=true";
      name = "Jua-Regular.ttf";
      sha256 = "769677aef240bfc3b9965f2b50748075bff885e6c6992fc591a3fb268279f898";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Jua-Regular.ttf $out/share/fonts/truetype/Jua-Regular.ttf
  '';

  meta = with lib; {
    description = "Jua";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
