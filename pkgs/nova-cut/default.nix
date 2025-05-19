{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nova-cut-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/novacut/NovaCut.ttf?raw=true";
      name = "NovaCut.ttf";
      sha256 = "09b4238312770fb6a4405027dc33feef1bb1c9283d3c907fe7282960da4eb5f7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NovaCut.ttf $out/share/fonts/truetype/NovaCut.ttf
  '';

  meta = with lib; {
    description = "Nova Cut";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
