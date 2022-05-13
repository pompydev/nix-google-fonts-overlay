{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "syne-tactile-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/39505d6d78a7a6ce2c13b9525487530d64ee547e/ofl/synetactile/SyneTactile-Regular.ttf?raw=true";
      name = "SyneTactile-Regular.ttf";
      sha256 = "d47ec3693a8f7a7fdf72cdee0e45c8fa0e08bc0b41ba41b8cf31509065ff0620";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SyneTactile-Regular.ttf $out/share/fonts/truetype/SyneTactile-Regular.ttf
  '';

  meta = with lib; {
    description = "Syne Tactile";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
