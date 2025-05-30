{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fresca-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/fresca/Fresca-Regular.ttf?raw=true";
      name = "Fresca-Regular.ttf";
      sha256 = "f64340016a820093202ca6af533f232ee7fe4c3d8448601ac42b4091236b5777";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Fresca-Regular.ttf $out/share/fonts/truetype/Fresca-Regular.ttf
  '';

  meta = with lib; {
    description = "Fresca";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
