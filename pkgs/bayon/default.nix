{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bayon-${version}";
  version = "2022-05-23-211740";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b95081fc50761be8e1392bff2f5fce234a8954a6/ofl/bayon/Bayon-Regular.ttf?raw=true";
      name = "Bayon-Regular.ttf";
      sha256 = "ffdeb7ad5ca1abd37631b0a637aaa1b2cd695f85e582f5c75ccce26bdaaf51b6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Bayon-Regular.ttf $out/share/fonts/truetype/Bayon-Regular.ttf
  '';

  meta = with lib; {
    description = "Bayon";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
