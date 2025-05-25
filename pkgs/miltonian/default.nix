{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "miltonian-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/miltonian/Miltonian-Regular.ttf?raw=true";
      name = "Miltonian-Regular.ttf";
      sha256 = "bd4ada3764e6774964efe097463533b2759755e390f68e3d16974264f8dd2d98";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Miltonian-Regular.ttf $out/share/fonts/truetype/Miltonian-Regular.ttf
  '';

  meta = with lib; {
    description = "Miltonian";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
