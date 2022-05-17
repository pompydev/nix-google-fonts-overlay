{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "dosis-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/59f86d8fc9353b362d45c981917024bc45a64145/ofl/dosis/Dosis[wght].ttf?raw=true";
      name = "Dosis_wght_.ttf";
      sha256 = "b2238eef0b3464904fed097ef274c704bc63d21407369b7d7a5be7b0821a0e82";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Dosis_wght_.ttf $out/share/fonts/truetype/Dosis_wght_.ttf
  '';

  meta = with lib; {
    description = "Dosis";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
