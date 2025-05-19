{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ma-shan-zheng-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/mashanzheng/MaShanZheng-Regular.ttf?raw=true";
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
