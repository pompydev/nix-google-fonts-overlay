{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rock-3d-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/rock3d/Rock3D-Regular.ttf?raw=true";
      name = "Rock3D-Regular.ttf";
      sha256 = "c95e67174335f12678fc309e321ad4e4099e9411b5a7a2edfbb5011116123f16";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Rock3D-Regular.ttf $out/share/fonts/truetype/Rock3D-Regular.ttf
  '';

  meta = with lib; {
    description = "Rock 3D";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
