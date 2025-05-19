{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "monsieur-la-doulaise-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/monsieurladoulaise/MonsieurLaDoulaise-Regular.ttf?raw=true";
      name = "MonsieurLaDoulaise-Regular.ttf";
      sha256 = "dd3e04fbe661a7a70ff87b56b446e57a2605de5659c84d35ef58f4606ee68fad";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MonsieurLaDoulaise-Regular.ttf $out/share/fonts/truetype/MonsieurLaDoulaise-Regular.ttf
  '';

  meta = with lib; {
    description = "Monsieur La Doulaise";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
