{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-jp-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansjp/NotoSansJP%5Bwght%5D.ttf?raw=true";
      name = "NotoSansJP_wght_.ttf";
      sha256 = "c2f3b4d463500a2ddcd3849cded1fceeb9fd6d1c32e6cbecd568453ba50fc68f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansJP_wght_.ttf $out/share/fonts/truetype/NotoSansJP_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans JP";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
