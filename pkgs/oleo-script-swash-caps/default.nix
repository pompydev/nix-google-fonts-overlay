{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "oleo-script-swash-caps-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/oleoscriptswashcaps/OleoScriptSwashCaps-Regular.ttf?raw=true";
      name = "OleoScriptSwashCaps-Regular.ttf";
      sha256 = "b8811c803202bbc80e6124200666080a62b63df3b52e1833456189ec1f798c31";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/oleoscriptswashcaps/OleoScriptSwashCaps-Bold.ttf?raw=true";
      name = "OleoScriptSwashCaps-Bold.ttf";
      sha256 = "0d622c6a5db8507ecbaaa844672e8553f26249c6a1566b098f54295a77eb42a2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 OleoScriptSwashCaps-Regular.ttf $out/share/fonts/truetype/OleoScriptSwashCaps-Regular.ttf
     install -Dm644 OleoScriptSwashCaps-Bold.ttf $out/share/fonts/truetype/OleoScriptSwashCaps-Bold.ttf
  '';

  meta = with lib; {
    description = "Oleo Script Swash Caps";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
