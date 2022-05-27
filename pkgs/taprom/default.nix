{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "taprom-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4f5dbdb58c9075640112a760b0f2376ab04cd187/ofl/taprom/Taprom-Regular.ttf?raw=true";
      name = "Taprom-Regular.ttf";
      sha256 = "d89c52e9ad32693ffbd8646e2770e331d83c310056badf32ce3b12b3e1b5b45a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Taprom-Regular.ttf $out/share/fonts/truetype/Taprom-Regular.ttf
  '';

  meta = with lib; {
    description = "Taprom";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
