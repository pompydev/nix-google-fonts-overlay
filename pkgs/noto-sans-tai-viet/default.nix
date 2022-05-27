{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-tai-viet-${version}";
  version = "2022-05-24-075352";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanstaiviet/NotoSansTaiViet-Regular.ttf?raw=true";
      name = "NotoSansTaiViet-Regular.ttf";
      sha256 = "b7e6d86488e34d9bbc3c6ba55097d8b1a16325650af50a7242df2c2a4a663ced";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansTaiViet-Regular.ttf $out/share/fonts/truetype/NotoSansTaiViet-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Tai Viet";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
