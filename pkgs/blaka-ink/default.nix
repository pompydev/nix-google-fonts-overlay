{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "blaka-ink-${version}";
  version = "2022-05-13-113124";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b6afa0153d4a941b4be101e651cf000287acd1c3/ofl/blakaink/BlakaInk-Regular.ttf?raw=true";
      name = "BlakaInk-Regular.ttf";
      sha256 = "2effe5be99706a57df02b738a80f4de57d679d4cea679ce70ad5a3280b67b418";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BlakaInk-Regular.ttf $out/share/fonts/truetype/BlakaInk-Regular.ttf
  '';

  meta = with lib; {
    description = "Blaka Ink";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
