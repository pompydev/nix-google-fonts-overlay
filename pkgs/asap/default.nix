{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "asap-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6daa244b0a0c6457128e0132cd4a7c7e8a5a7893/ofl/asap/Asap[wght].ttf?raw=true";
      name = "Asap_wght_.ttf";
      sha256 = "a57c8bfe4969bdc57903aac09d0b3d3081b1b00be5079b20e3e864d78a943073";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6daa244b0a0c6457128e0132cd4a7c7e8a5a7893/ofl/asap/Asap-Italic[wght].ttf?raw=true";
      name = "Asap-Italic_wght_.ttf";
      sha256 = "22d5c46ef129f55fbf99f1c24b1ebaf3b15be1f6020f9c6e8510f739e2c7657d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Asap_wght_.ttf $out/share/fonts/truetype/Asap_wght_.ttf
     install -Dm644 Asap-Italic_wght_.ttf $out/share/fonts/truetype/Asap-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Asap";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
