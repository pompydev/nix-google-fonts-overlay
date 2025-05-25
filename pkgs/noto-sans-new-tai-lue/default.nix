{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-new-tai-lue-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansnewtailue/NotoSansNewTaiLue%5Bwght%5D.ttf?raw=true";
      name = "NotoSansNewTaiLue_wght_.ttf";
      sha256 = "5362f7ab42089804beb05c936bef575f08ab27cf26109c71df99bfa28bda1cb4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansNewTaiLue_wght_.ttf $out/share/fonts/truetype/NotoSansNewTaiLue_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans New Tai Lue";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
