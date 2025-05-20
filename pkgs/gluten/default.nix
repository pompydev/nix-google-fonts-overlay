{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gluten-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/gluten/Gluten%5Bslnt,wght%5D.ttf?raw=true";
      name = "Gluten_slnt,wght_.ttf";
      sha256 = "cb4b01e4754e36615125e7cb16fe1ec8255d1db02d0b236d7c992438dc1a83e4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Gluten_slnt-wght_.ttf $out/share/fonts/truetype/Gluten_slnt-wght_.ttf
  '';

  meta = with lib; {
    description = "Gluten";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
