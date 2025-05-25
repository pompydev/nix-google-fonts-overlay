{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "astloch-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/astloch/Astloch-Regular.ttf?raw=true";
      name = "Astloch-Regular.ttf";
      sha256 = "1b6f98e4c391da70d9166182369f90164cb02870ad210c4b3287f35ff28227f0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/astloch/Astloch-Bold.ttf?raw=true";
      name = "Astloch-Bold.ttf";
      sha256 = "dee95fb52f9b24afc701e9991208275f654160870db06bec84cecb25e10fbeee";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Astloch-Regular.ttf $out/share/fonts/truetype/Astloch-Regular.ttf
     install -Dm644 Astloch-Bold.ttf $out/share/fonts/truetype/Astloch-Bold.ttf
  '';

  meta = with lib; {
    description = "Astloch";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
