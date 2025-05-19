{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-sora-sompeng-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanssorasompeng/NotoSansSoraSompeng%5Bwght%5D.ttf?raw=true";
      name = "NotoSansSoraSompeng_wght_.ttf";
      sha256 = "1fe66f4904e960705b68c60f7e92ae579ef80bab30f29b894d44eed1edc306e0";
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
