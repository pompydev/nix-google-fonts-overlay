{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "swanky-and-moo-moo-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/swankyandmoomoo/SwankyandMooMoo.ttf?raw=true";
      name = "SwankyandMooMoo.ttf";
      sha256 = "a745effa8961790717966f7c69d96756a7abe2d334a08be333a656b7c54b627f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SwankyandMooMoo.ttf $out/share/fonts/truetype/SwankyandMooMoo.ttf
  '';

  meta = with lib; {
    description = "Swanky and Moo Moo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
