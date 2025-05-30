{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kelly-slab-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/kellyslab/KellySlab-Regular.ttf?raw=true";
      name = "KellySlab-Regular.ttf";
      sha256 = "cbf98bddb534c52d2f1150aed233c53e5e3a7966b7be1ab860550c23f9930c27";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 KellySlab-Regular.ttf $out/share/fonts/truetype/KellySlab-Regular.ttf
  '';

  meta = with lib; {
    description = "Kelly Slab";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
