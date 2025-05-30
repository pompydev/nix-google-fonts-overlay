{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "puppies-play-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/puppiesplay/PuppiesPlay-Regular.ttf?raw=true";
      name = "PuppiesPlay-Regular.ttf";
      sha256 = "104fd20ddc4f78f256dd5e3a77d2cfdb0ef5b26e467404377f7bd0afabbb24c0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PuppiesPlay-Regular.ttf $out/share/fonts/truetype/PuppiesPlay-Regular.ttf
  '';

  meta = with lib; {
    description = "Puppies Play";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
