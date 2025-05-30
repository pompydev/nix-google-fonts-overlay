{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gajraj-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/gajrajone/GajrajOne-Regular.ttf?raw=true";
      name = "GajrajOne-Regular.ttf";
      sha256 = "eb924f0e1cb9f29f129a76645dadcc36d0f3a831185ac530a6b5af607ae06231";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GajrajOne-Regular.ttf $out/share/fonts/truetype/GajrajOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Gajraj One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
