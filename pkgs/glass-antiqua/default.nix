{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "glass-antiqua-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/glassantiqua/GlassAntiqua-Regular.ttf?raw=true";
      name = "GlassAntiqua-Regular.ttf";
      sha256 = "af93faedd95bd2ea55fd6f6ca62136933b641497693f15b19fc3642d54b5b44e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GlassAntiqua-Regular.ttf $out/share/fonts/truetype/GlassAntiqua-Regular.ttf
  '';

  meta = with lib; {
    description = "Glass Antiqua";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
