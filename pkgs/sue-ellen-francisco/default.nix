{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sue-ellen-francisco-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/023aa4b2855c95413d1b1c510ad812beb345df75/ofl/sueellenfrancisco/SueEllenFrancisco-Regular.ttf?raw=true";
      name = "SueEllenFrancisco-Regular.ttf";
      sha256 = "d6d72e046e8e92f659eacfb7457cf7e1f2142c112c3d8c43c0b5a3904a5c8621";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SueEllenFrancisco-Regular.ttf $out/share/fonts/truetype/SueEllenFrancisco-Regular.ttf
  '';

  meta = with lib; {
    description = "Sue Ellen Francisco";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
