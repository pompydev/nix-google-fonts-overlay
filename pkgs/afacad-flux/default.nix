{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "afacad-flux-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/afacadflux/AfacadFlux%5Bslnt,wght%5D.ttf?raw=true";
      name = "AfacadFlux_slnt,wght_.ttf";
      sha256 = "28aa3569ad95f7f7b363890085ad231aad280b3f7f73d37bf6d80285189ea636";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AfacadFlux_slnt-wght_.ttf $out/share/fonts/truetype/AfacadFlux_slnt-wght_.ttf
  '';

  meta = with lib; {
    description = "Afacad Flux";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
