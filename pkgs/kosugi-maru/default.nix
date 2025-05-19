{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kosugi-maru-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/apache/kosugimaru/KosugiMaru-Regular.ttf?raw=true";
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
