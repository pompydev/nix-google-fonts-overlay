{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jaldi-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/jaldi/Jaldi-Regular.ttf?raw=true";
      name = "Jaldi-Regular.ttf";
      sha256 = "26f34c48b7baa838dd459b5f5db026e9493bb468efc2956761c52134d478d2e2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/jaldi/Jaldi-Bold.ttf?raw=true";
      name = "Jaldi-Bold.ttf";
      sha256 = "5518eef27bab146f957c70fe50ef10bea8fe363d3ac75cc797aa882a7226bd99";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Jaldi-Regular.ttf $out/share/fonts/truetype/Jaldi-Regular.ttf
     install -Dm644 Jaldi-Bold.ttf $out/share/fonts/truetype/Jaldi-Bold.ttf
  '';

  meta = with lib; {
    description = "Jaldi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
