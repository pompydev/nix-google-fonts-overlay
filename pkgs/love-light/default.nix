{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "love-light-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6612051d78193f5f624909f6768f132bc8343934/ofl/lovelight/LoveLight-Regular.ttf?raw=true";
      name = "LoveLight-Regular.ttf";
      sha256 = "2036790ee211f84616197d5bdb90cd519d51a20013df2ffb8c9f3df996f1e016";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LoveLight-Regular.ttf $out/share/fonts/truetype/LoveLight-Regular.ttf
  '';

  meta = with lib; {
    description = "Love Light";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
