{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-tai-tham-${version}";
  version = "2022-05-24-075352";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanstaitham/NotoSansTaiTham%5Bwght%5D.ttf?raw=true";
      name = "NotoSansTaiTham_wght_.ttf";
      sha256 = "a95a6dabbdf3f381d98ebc1b2e6df7a8cc918acb469ba77a56c2b7a341894693";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansTaiTham_wght_.ttf $out/share/fonts/truetype/NotoSansTaiTham_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Tai Tham";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
