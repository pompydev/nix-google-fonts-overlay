{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ma-shan-zheng-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/mashanzheng/MaShanZheng-Regular.ttf?raw=true";
      name = "MaShanZheng-Regular.ttf";
      sha256 = "3f1516c14f2576b9070ef5dab3145d2d8243aab7179abeab8953baa1bb253afa";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MaShanZheng-Regular.ttf $out/share/fonts/truetype/MaShanZheng-Regular.ttf
  '';

  meta = with lib; {
    description = "Ma Shan Zheng";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
