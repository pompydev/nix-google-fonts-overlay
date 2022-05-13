{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "baloo-2-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8e0cd05881f3ae5e933ba4161103005a3e841ce0/ofl/baloo2/Baloo2[wght].ttf?raw=true";
      name = "Baloo2[wght].ttf";
      sha256 = "d47a6852548059b1db49a1319d06d499d546c3fa2237cf9eee9c43c8abb025c2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Baloo2[wght].ttf' $out/share/fonts/truetype/'Baloo2[wght].ttf'
  '';

  meta = with lib; {
    description = "Baloo 2";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
