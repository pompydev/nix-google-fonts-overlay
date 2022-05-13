{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-kr-${version}";
  version = "2022-05-12-102739";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b597fde37af1338d5ceac92286c0add81a2824a5/ofl/notosanskr/NotoSansKR[wght].ttf?raw=true";
      name = "NotoSansKR[wght].ttf";
      sha256 = "1e609f3e762c3dc3c24cc95ebf194c193bdc2d5fc17c29f598195da4e87cf67a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'NotoSansKR[wght].ttf' $out/share/fonts/truetype/'NotoSansKR[wght].ttf'
  '';

  meta = with lib; {
    description = "Noto Sans KR";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
