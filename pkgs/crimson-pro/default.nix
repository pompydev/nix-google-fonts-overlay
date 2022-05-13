{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "crimson-pro-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5c70a7919f949918e4b3d994dfc3c8864d174578/ofl/crimsonpro/CrimsonPro[wght].ttf?raw=true";
      name = "CrimsonPro[wght].ttf";
      sha256 = "16aa9fb7300a93637da51fac03a071b2ff08b6bbf65f99c794c25f040b58af6a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5c70a7919f949918e4b3d994dfc3c8864d174578/ofl/crimsonpro/CrimsonPro-Italic[wght].ttf?raw=true";
      name = "CrimsonPro-Italic[wght].ttf";
      sha256 = "a74dc11dcf2fbb1452064e42395a40a907ca630b49cff86012223785e52b2559";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'CrimsonPro[wght].ttf' $out/share/fonts/truetype/'CrimsonPro[wght].ttf'
     install -Dm644 'CrimsonPro-Italic[wght].ttf' $out/share/fonts/truetype/'CrimsonPro-Italic[wght].ttf'
  '';

  meta = with lib; {
    description = "Crimson Pro";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
