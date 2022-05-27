{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "estonia-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c1c96b1743b6a1984844abd0ecceb16224640652/ofl/estonia/Estonia-Regular.ttf?raw=true";
      name = "Estonia-Regular.ttf";
      sha256 = "03087597ea24879c19d51ca4622f8c4e9cd867d081e7ad0ad3e7dccfdb1933b2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Estonia-Regular.ttf $out/share/fonts/truetype/Estonia-Regular.ttf
  '';

  meta = with lib; {
    description = "Estonia";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
