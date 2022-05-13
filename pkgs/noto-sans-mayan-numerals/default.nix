{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-mayan-numerals-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansmayannumerals/NotoSansMayanNumerals-Regular.ttf?raw=true";
      name = "NotoSansMayanNumerals-Regular.ttf";
      sha256 = "5832050be8933ebbbe32e0ec2500ad27cace47a2cbe0a43e250cdef0a454bada";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansMayanNumerals-Regular.ttf $out/share/fonts/truetype/NotoSansMayanNumerals-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Mayan Numerals";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
