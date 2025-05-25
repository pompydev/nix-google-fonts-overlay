{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tektur-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/tektur/Tektur%5Bwdth,wght%5D.ttf?raw=true";
      name = "Tektur_wdth,wght_.ttf";
      sha256 = "a4c451e5336874811267c2a514efa09bca7bc8cabf32a310f0b44e111eacb933";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Tektur_wdth-wght_.ttf $out/share/fonts/truetype/Tektur_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Tektur";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
