{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "museomoderno-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e151ae63ce2df8f180388b1482be245f75754cde/ofl/museomoderno/MuseoModerno%5Bwght%5D.ttf?raw=true";
      name = "MuseoModerno_wght_.ttf";
      sha256 = "fb5809d00561da99e3283dbd357a6fc459e4432296a6eca92bcbda29a398e4ec";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MuseoModerno_wght_.ttf $out/share/fonts/truetype/MuseoModerno_wght_.ttf
  '';

  meta = with lib; {
    description = "MuseoModerno";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
