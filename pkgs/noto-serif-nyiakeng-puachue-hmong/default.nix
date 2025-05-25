{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-nyiakeng-puachue-hmong-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notoserifnyiakengpuachuehmong/NotoSerifNyiakengPuachueHmong%5Bwght%5D.ttf?raw=true";
      name = "NotoSerifNyiakengPuachueHmong_wght_.ttf";
      sha256 = "802b838de1cae59401c5140620479ee6dc4eaa28d877d4fcc5b79d92e8b43555";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifNyiakengPuachueHmong_wght_.ttf $out/share/fonts/truetype/NotoSerifNyiakengPuachueHmong_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Nyiakeng Puachue Hmong";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
