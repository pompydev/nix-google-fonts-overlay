{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "metrophobic-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b4e1615381e87f08a5d19bfcece435e612968c72/ofl/metrophobic/Metrophobic-Regular.ttf?raw=true";
      name = "Metrophobic-Regular.ttf";
      sha256 = "f64caeab0ed6d83e429e544083b3ac391304b8b4ad3a4c561dbc88854cef0d02";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Metrophobic-Regular.ttf $out/share/fonts/truetype/Metrophobic-Regular.ttf
  '';

  meta = with lib; {
    description = "Metrophobic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
