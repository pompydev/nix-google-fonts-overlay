{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "huninn-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/huninn/Huninn-Regular.ttf?raw=true";
      name = "Huninn-Regular.ttf";
      sha256 = "1bd770a5ffc0c06723b567686f8b5db5abf9ab54227f3bbc4e6fd648f4698805";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Huninn-Regular.ttf $out/share/fonts/truetype/Huninn-Regular.ttf
  '';

  meta = with lib; {
    description = "Huninn";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
