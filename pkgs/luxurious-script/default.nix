{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "luxurious-script-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/luxuriousscript/LuxuriousScript-Regular.ttf?raw=true";
      name = "LuxuriousScript-Regular.ttf";
      sha256 = "db1a118a34eb835f7960a09d8be472b65971d7798772842dc3cd37a8641491e9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LuxuriousScript-Regular.ttf $out/share/fonts/truetype/LuxuriousScript-Regular.ttf
  '';

  meta = with lib; {
    description = "Luxurious Script";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
