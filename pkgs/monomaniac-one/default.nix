{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "monomaniac-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/monomaniacone/MonomaniacOne-Regular.ttf?raw=true";
      name = "MonomaniacOne-Regular.ttf";
      sha256 = "4045d2b419268efce1b1ef33004603c74c045804137693f1fb98c79576f31c6f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MonomaniacOne-Regular.ttf $out/share/fonts/truetype/MonomaniacOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Monomaniac One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
