{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "plus-jakarta-sans-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/092204231c6bf36c0871c0cad11077660106cef5/ofl/plusjakartasans/PlusJakartaSans[wght].ttf?raw=true";
      name = "PlusJakartaSans[wght].ttf";
      sha256 = "917ee5a81ce762d0756c0541b169cfd592154f718db73e5c167945fb04670f29";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/092204231c6bf36c0871c0cad11077660106cef5/ofl/plusjakartasans/PlusJakartaSans-Italic[wght].ttf?raw=true";
      name = "PlusJakartaSans-Italic[wght].ttf";
      sha256 = "422c593fd0e26bf7aecf9b6d3996e76467894249cdc9c2f4ba9453b1c49d8f03";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'PlusJakartaSans[wght].ttf' $out/share/fonts/truetype/'PlusJakartaSans[wght].ttf'
     install -Dm644 'PlusJakartaSans-Italic[wght].ttf' $out/share/fonts/truetype/'PlusJakartaSans-Italic[wght].ttf'
  '';

  meta = with lib; {
    description = "Plus Jakarta Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
