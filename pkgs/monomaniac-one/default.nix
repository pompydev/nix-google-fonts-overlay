{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "monomaniac-one-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3eec0534f6121952cd7d0d3d79d360831ff04110/ofl/monomaniacone/MonomaniacOne-Regular.ttf?raw=true";
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
