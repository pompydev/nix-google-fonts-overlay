{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "akaya-kanadaka-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6bfbea71f6fc369d78fa7aa975d1462db45fc7cf/ofl/akayakanadaka/AkayaKanadaka-Regular.ttf?raw=true";
      name = "AkayaKanadaka-Regular.ttf";
      sha256 = "7891840f8c14326220aafd73f599f592bf44c60e4f8882bcf7c57426d62e9427";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AkayaKanadaka-Regular.ttf $out/share/fonts/truetype/AkayaKanadaka-Regular.ttf
  '';

  meta = with lib; {
    description = "Akaya Kanadaka";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
