{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "porter-sans-block-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/portersansblock/PorterSansBlock-Regular.ttf?raw=true";
      name = "PorterSansBlock-Regular.ttf";
      sha256 = "760943d1b089f37c8d079f3e0347e2b0858c8598894f2c04b7dc52cbd2ab4dfd";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PorterSansBlock-Regular.ttf $out/share/fonts/truetype/PorterSansBlock-Regular.ttf
  '';

  meta = with lib; {
    description = "Porter Sans Block";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
