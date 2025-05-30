{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "reenie-beanie-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/reeniebeanie/ReenieBeanie.ttf?raw=true";
      name = "ReenieBeanie.ttf";
      sha256 = "0ea608aa325bf9e11c9590cc0b63dcf7cd215e270784f1ebbe6fad4927b31ff8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ReenieBeanie.ttf $out/share/fonts/truetype/ReenieBeanie.ttf
  '';

  meta = with lib; {
    description = "Reenie Beanie";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
