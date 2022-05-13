{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "syne-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/54fb97bd69162b95b2aa2c3996ffd71466c1aec2/ofl/syne/Syne[wght].ttf?raw=true";
      name = "Syne[wght].ttf";
      sha256 = "ce5ac77142a65cab2248a1a2ebb740b1d4d9c20b52488877d3ff664d1356104a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Syne[wght].ttf' $out/share/fonts/truetype/'Syne[wght].ttf'
  '';

  meta = with lib; {
    description = "Syne";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
