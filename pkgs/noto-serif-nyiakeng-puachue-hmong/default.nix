{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-nyiakeng-puachue-hmong-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoserifnyiakengpuachuehmong/NotoSerifNyiakengPuachueHmong%5Bwght%5D.ttf?raw=true";
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
