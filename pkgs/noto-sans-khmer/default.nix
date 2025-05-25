{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-khmer-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanskhmer/NotoSansKhmer%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansKhmer_wdth,wght_.ttf";
      sha256 = "f37a8431a0c5d5ed2f81a767417546aca576a81fb7eff9c924d46aecf828f2ca";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansKhmer_wdth-wght_.ttf $out/share/fonts/truetype/NotoSansKhmer_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Khmer";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
