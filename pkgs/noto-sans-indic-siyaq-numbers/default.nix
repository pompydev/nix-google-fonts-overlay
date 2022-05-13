{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-indic-siyaq-numbers-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansindicsiyaqnumbers/NotoSansIndicSiyaqNumbers-Regular.ttf?raw=true";
      name = "NotoSansIndicSiyaqNumbers-Regular.ttf";
      sha256 = "1d5fd023870ac85d0b16a7ac8b7f679db2c475e2719849670cac029d6d2ec43b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansIndicSiyaqNumbers-Regular.ttf $out/share/fonts/truetype/NotoSansIndicSiyaqNumbers-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Indic Siyaq Numbers";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
