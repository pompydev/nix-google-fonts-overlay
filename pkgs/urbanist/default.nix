{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "urbanist-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/69409947a524cb5c9fdc3977270e8bcb3a95a498/ofl/urbanist/Urbanist[wght].ttf?raw=true";
      name = "Urbanist[wght].ttf";
      sha256 = "748362d51eb276840e9f0023cd2d98299bf709a95fb3a5ae4ffcb624c638ebb9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/69409947a524cb5c9fdc3977270e8bcb3a95a498/ofl/urbanist/Urbanist-Italic[wght].ttf?raw=true";
      name = "Urbanist-Italic[wght].ttf";
      sha256 = "05ac7a65decda23806d1678d44b8ef23dd656d6793555499dd79ee24c3e777ed";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Urbanist[wght].ttf' $out/share/fonts/truetype/'Urbanist[wght].ttf'
     install -Dm644 'Urbanist-Italic[wght].ttf' $out/share/fonts/truetype/'Urbanist-Italic[wght].ttf'
  '';

  meta = with lib; {
    description = "Urbanist";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
