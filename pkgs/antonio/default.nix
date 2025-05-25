{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "antonio-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/antonio/Antonio%5Bwght%5D.ttf?raw=true";
      name = "Antonio_wght_.ttf";
      sha256 = "9e95a2258ecdf3e45c72c5bbea1c4cd350e8f7bebc87c9dba53b29b1890b8903";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Antonio_wght_.ttf $out/share/fonts/truetype/Antonio_wght_.ttf
  '';

  meta = with lib; {
    description = "Antonio";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
