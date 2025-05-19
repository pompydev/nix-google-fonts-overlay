{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ranchers-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ranchers/Ranchers-Regular.ttf?raw=true";
      name = "Ranchers-Regular.ttf";
      sha256 = "19568aba8965664d1bc6f5a48c24d269c97501eed87af26b912f42b6e6f22adc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Ranchers-Regular.ttf $out/share/fonts/truetype/Ranchers-Regular.ttf
  '';

  meta = with lib; {
    description = "Ranchers";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
