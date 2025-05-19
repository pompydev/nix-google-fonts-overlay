{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gravitas-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/gravitasone/GravitasOne.ttf?raw=true";
      name = "GravitasOne.ttf";
      sha256 = "b40dc45f3354f282107286acf1542072d258c717c8edf1d118ef0105f25e627b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GravitasOne.ttf $out/share/fonts/truetype/GravitasOne.ttf
  '';

  meta = with lib; {
    description = "Gravitas One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
