{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kreon-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e38615a06eecd445550a1cf90aed75885e986f98/ofl/kreon/Kreon%5Bwght%5D.ttf?raw=true";
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
