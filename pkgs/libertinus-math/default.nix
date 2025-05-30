{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "libertinus-math-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/libertinusmath/LibertinusMath-Regular.ttf?raw=true";
      name = "LibertinusMath-Regular.ttf";
      sha256 = "6eaebb1260c45328a49299a614eb20cee6d0b5c2fbb0d48314def159e0715318";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LibertinusMath-Regular.ttf $out/share/fonts/truetype/LibertinusMath-Regular.ttf
  '';

  meta = with lib; {
    description = "Libertinus Math";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
