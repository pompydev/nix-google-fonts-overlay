{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "italianno-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/italianno/Italianno-Regular.ttf?raw=true";
      name = "Italianno-Regular.ttf";
      sha256 = "f6ae96dea0da46c73370eb0575848ab0eda190315bdfda3f5b252bba3dc9173c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Italianno-Regular.ttf $out/share/fonts/truetype/Italianno-Regular.ttf
  '';

  meta = with lib; {
    description = "Italianno";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
