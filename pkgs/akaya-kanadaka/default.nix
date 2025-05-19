{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "akaya-kanadaka-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/akayakanadaka/AkayaKanadaka-Regular.ttf?raw=true";
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
