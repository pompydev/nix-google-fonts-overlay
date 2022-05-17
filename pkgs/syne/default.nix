{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "syne-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/54fb97bd69162b95b2aa2c3996ffd71466c1aec2/ofl/syne/Syne%5Bwght%5D.ttf?raw=true";
      name = "Syne_wght_.ttf";
      sha256 = "ce5ac77142a65cab2248a1a2ebb740b1d4d9c20b52488877d3ff664d1356104a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Syne_wght_.ttf $out/share/fonts/truetype/Syne_wght_.ttf
  '';

  meta = with lib; {
    description = "Syne";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
