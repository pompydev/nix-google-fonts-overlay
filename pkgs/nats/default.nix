{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nats-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/nats/NATS-Regular.ttf?raw=true";
      name = "NATS-Regular.ttf";
      sha256 = "0e660a99459c55c9031f9c55b8b5038debadaec56bab4849d838f7e411f2fcbb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NATS-Regular.ttf $out/share/fonts/truetype/NATS-Regular.ttf
  '';

  meta = with lib; {
    description = "NATS";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
