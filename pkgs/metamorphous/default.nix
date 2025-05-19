{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "metamorphous-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/metamorphous/Metamorphous-Regular.ttf?raw=true";
      name = "Metamorphous-Regular.ttf";
      sha256 = "55939a5664e06807e87fa4af64f52039ead12f002dda8317393fdce2f7ff57fe";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Metamorphous-Regular.ttf $out/share/fonts/truetype/Metamorphous-Regular.ttf
  '';

  meta = with lib; {
    description = "Metamorphous";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
