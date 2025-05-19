{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mada-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/mada/Mada%5Bwght%5D.ttf?raw=true";
      name = "Mada_wght_.ttf";
      sha256 = "bf4d193ee78cea2fd8bdc9e64e5cb7e8a19ff76ab74f97a9a4a0e80f8f4cefde";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Mada_wght_.ttf $out/share/fonts/truetype/Mada_wght_.ttf
  '';

  meta = with lib; {
    description = "Mada";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
