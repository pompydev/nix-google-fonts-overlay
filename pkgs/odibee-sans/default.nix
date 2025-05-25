{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "odibee-sans-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/odibeesans/OdibeeSans-Regular.ttf?raw=true";
      name = "OdibeeSans-Regular.ttf";
      sha256 = "4e4006c713f5509f772f64e16c8a0821ad26411a69f688c71b127568355520e8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 OdibeeSans-Regular.ttf $out/share/fonts/truetype/OdibeeSans-Regular.ttf
  '';

  meta = with lib; {
    description = "Odibee Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
