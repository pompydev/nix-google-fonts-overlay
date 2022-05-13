{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "oxanium-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/becd3517c582fa68f041364b02bc597ee822ef1c/ofl/oxanium/Oxanium[wght].ttf?raw=true";
      name = "Oxanium[wght].ttf";
      sha256 = "2ce01d946e1e1ffc8d7eecfffbda8623bedd63eaf811a20488c4b69af45babb0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Oxanium[wght].ttf' $out/share/fonts/truetype/'Oxanium[wght].ttf'
  '';

  meta = with lib; {
    description = "Oxanium";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
