{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "beiruti-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/beiruti/Beiruti%5Bwght%5D.ttf?raw=true";
      name = "Beiruti_wght_.ttf";
      sha256 = "c31f26b93e90ac916757de63c060370c5382457f85d50f64f930b96e5477f222";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Beiruti_wght_.ttf $out/share/fonts/truetype/Beiruti_wght_.ttf
  '';

  meta = with lib; {
    description = "Beiruti";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
