{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "vampiro-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/vampiroone/VampiroOne-Regular.ttf?raw=true";
      name = "VampiroOne-Regular.ttf";
      sha256 = "6e1920a4bbbc66552f793ecc686313ef09469ae75b6b25878bf8923fdfecb2a2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 VampiroOne-Regular.ttf $out/share/fonts/truetype/VampiroOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Vampiro One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
