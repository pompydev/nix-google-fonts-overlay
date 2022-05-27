{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-pau-cin-hau-${version}";
  version = "2022-05-24-075352";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanspaucinhau/NotoSansPauCinHau-Regular.ttf?raw=true";
      name = "NotoSansPauCinHau-Regular.ttf";
      sha256 = "50fd145467b5d971b526643c73784e8530f5571f8192876b8d6654f94bf6d47b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansPauCinHau-Regular.ttf $out/share/fonts/truetype/NotoSansPauCinHau-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Pau Cin Hau";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
