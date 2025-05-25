{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "big-shoulders-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bigshoulders/BigShoulders%5Bopsz,wght%5D.ttf?raw=true";
      name = "BigShoulders_opsz,wght_.ttf";
      sha256 = "4b4b24aa6f799aa73cdcd5b6fa840cbcbbb38b81fa9fa82c25126a4530c1ba44";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BigShoulders_opsz-wght_.ttf $out/share/fonts/truetype/BigShoulders_opsz-wght_.ttf
  '';

  meta = with lib; {
    description = "Big Shoulders";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
