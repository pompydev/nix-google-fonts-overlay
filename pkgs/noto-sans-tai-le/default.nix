{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-tai-le-${version}";
  version = "2022-05-24-075352";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanstaile/NotoSansTaiLe-Regular.ttf?raw=true";
      name = "NotoSansTaiLe-Regular.ttf";
      sha256 = "a2cde56384066013cf1efafc5d3cfc142b9a0d10c77c7e1f8ee2880cbe121d4c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansTaiLe-Regular.ttf $out/share/fonts/truetype/NotoSansTaiLe-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Tai Le";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
