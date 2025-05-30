{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "vt323-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/vt323/VT323-Regular.ttf?raw=true";
      name = "VT323-Regular.ttf";
      sha256 = "cf4de751ada78ceac033dbe16a687742939995b77bc2a052ae17a4957958594d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 VT323-Regular.ttf $out/share/fonts/truetype/VT323-Regular.ttf
  '';

  meta = with lib; {
    description = "VT323";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
