{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "libertinus-mono-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/libertinusmono/LibertinusMono-Regular.ttf?raw=true";
      name = "LibertinusMono-Regular.ttf";
      sha256 = "98e3326985108f7d427d1f447d4fa00c93f6787bc53b5c15150c115c5b9d9b9a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LibertinusMono-Regular.ttf $out/share/fonts/truetype/LibertinusMono-Regular.ttf
  '';

  meta = with lib; {
    description = "Libertinus Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
