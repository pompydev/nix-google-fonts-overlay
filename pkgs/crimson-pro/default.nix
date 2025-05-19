{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "crimson-pro-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/crimsonpro/CrimsonPro%5Bwght%5D.ttf?raw=true";
      name = "CrimsonPro_wght_.ttf";
      sha256 = "16aa9fb7300a93637da51fac03a071b2ff08b6bbf65f99c794c25f040b58af6a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/crimsonpro/CrimsonPro-Italic%5Bwght%5D.ttf?raw=true";
      name = "CrimsonPro-Italic_wght_.ttf";
      sha256 = "a74dc11dcf2fbb1452064e42395a40a907ca630b49cff86012223785e52b2559";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CrimsonPro_wght_.ttf $out/share/fonts/truetype/CrimsonPro_wght_.ttf
     install -Dm644 CrimsonPro-Italic_wght_.ttf $out/share/fonts/truetype/CrimsonPro-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Crimson Pro";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
