{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "im-fell-great-primer-sc-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/imfellgreatprimersc/IMFeGPsc28P.ttf?raw=true";
      name = "IMFeGPsc28P.ttf";
      sha256 = "78952e5990c83116ef01ad7402f4384b1b9bc5c6c38690d2048f16a5317ff0c4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 IMFeGPsc28P.ttf $out/share/fonts/truetype/IMFeGPsc28P.ttf
  '';

  meta = with lib; {
    description = "IM Fell Great Primer SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
