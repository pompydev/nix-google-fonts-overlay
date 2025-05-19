{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "meie-script-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/meiescript/MeieScript-Regular.ttf?raw=true";
      name = "MeieScript-Regular.ttf";
      sha256 = "006c66ba5d8de0b824821d9444ba97b149e26715944c1a8ab427bbb35704e6c0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MeieScript-Regular.ttf $out/share/fonts/truetype/MeieScript-Regular.ttf
  '';

  meta = with lib; {
    description = "Meie Script";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
