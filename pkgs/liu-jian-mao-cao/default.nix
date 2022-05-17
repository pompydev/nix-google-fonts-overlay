{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "liu-jian-mao-cao-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0bf38a8a393773912e43d57dfb8b45e7fb868044/ofl/liujianmaocao/LiuJianMaoCao-Regular.ttf?raw=true";
      name = "LiuJianMaoCao-Regular.ttf";
      sha256 = "cab396b91a5b7c0b4005a35891180d06e6751f5ac261fe680aec65c1ae209033";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LiuJianMaoCao-Regular.ttf $out/share/fonts/truetype/LiuJianMaoCao-Regular.ttf
  '';

  meta = with lib; {
    description = "Liu Jian Mao Cao";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
