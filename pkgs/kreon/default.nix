{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kreon-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e38615a06eecd445550a1cf90aed75885e986f98/ofl/kreon/Kreon[wght].ttf?raw=true";
      name = "Kreon[wght].ttf";
      sha256 = "3fdb29ba16fe1907747c40b4706d3b8f91a9e95171609194bc10cbd16d982943";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Kreon[wght].ttf' $out/share/fonts/truetype/'Kreon[wght].ttf'
  '';

  meta = with lib; {
    description = "Kreon";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
