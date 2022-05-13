{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kosugi-maru-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5696ef41e279e8ac3bc2835e60453a49dfcf3986/apache/kosugimaru/KosugiMaru-Regular.ttf?raw=true";
      name = "KosugiMaru-Regular.ttf";
      sha256 = "4b8d0022c8dadd090ef67cd1f71f130714767af7806cba2eb4ebe4b0271c1d68";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 KosugiMaru-Regular.ttf $out/share/fonts/truetype/KosugiMaru-Regular.ttf
  '';

  meta = with lib; {
    description = "Kosugi Maru";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
