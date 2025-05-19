{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bangers-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bangers/Bangers-Regular.ttf?raw=true";
      name = "Bangers-Regular.ttf";
      sha256 = "4160a7311de9342674cce9160cde9fcbb30f48190397d86ff1b70b455af65824";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Bangers-Regular.ttf $out/share/fonts/truetype/Bangers-Regular.ttf
  '';

  meta = with lib; {
    description = "Bangers";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
