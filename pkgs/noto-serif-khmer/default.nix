{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-khmer-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notoserifkhmer/NotoSerifKhmer[wdth,wght].ttf?raw=true";
      name = "NotoSerifKhmer_wdth,wght_.ttf";
      sha256 = "c86b031c647f8575fbb56e2ca1cd8207f45b077ed573b0436ba29759c89e715f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifKhmer_wdth,wght_.ttf $out/share/fonts/truetype/NotoSerifKhmer_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Khmer";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
