{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "luxurious-script-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ea4cc33bf2e7af6b2de45b34518206f61eeafa84/ofl/luxuriousscript/LuxuriousScript-Regular.ttf?raw=true";
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
