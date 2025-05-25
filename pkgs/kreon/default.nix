{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kreon-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/kreon/Kreon%5Bwght%5D.ttf?raw=true";
      name = "Kreon_wght_.ttf";
      sha256 = "3fdb29ba16fe1907747c40b4706d3b8f91a9e95171609194bc10cbd16d982943";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Kreon_wght_.ttf $out/share/fonts/truetype/Kreon_wght_.ttf
  '';

  meta = with lib; {
    description = "Kreon";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
