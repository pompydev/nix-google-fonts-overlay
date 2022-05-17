{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-sora-sompeng-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanssorasompeng/NotoSansSoraSompeng%5Bwght%5D.ttf?raw=true";
      name = "NotoSansSoraSompeng_wght_.ttf";
      sha256 = "b714275278d77a82778e330220dcc50c614ae0aa78e987c3f18e2e3aa34f3208";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansSoraSompeng_wght_.ttf $out/share/fonts/truetype/NotoSansSoraSompeng_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Sora Sompeng";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
