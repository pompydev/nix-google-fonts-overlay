{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-tai-tham-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanstaitham/NotoSansTaiTham%5Bwght%5D.ttf?raw=true";
      name = "NotoSansTaiTham_wght_.ttf";
      sha256 = "a053b99fc5ed0a3e5fb14eecbbf137245cb0b8c34c2cb4ffd0872db3097bcd0a";
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
