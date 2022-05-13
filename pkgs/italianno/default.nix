{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "italianno-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c7039c870a09971a8f458ea1311b5ddf68cbfec3/ofl/italianno/Italianno-Regular.ttf?raw=true";
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
