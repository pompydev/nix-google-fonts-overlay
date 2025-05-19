{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "brygada-1918-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/brygada1918/Brygada1918%5Bwght%5D.ttf?raw=true";
      name = "Brygada1918_wght_.ttf";
      sha256 = "93a23e7c6de5e2c54410116abceed294a05b71aa03af52fbaa92c2cc79003d4d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/brygada1918/Brygada1918-Italic%5Bwght%5D.ttf?raw=true";
      name = "Brygada1918-Italic_wght_.ttf";
      sha256 = "c694f075a9240c47c72a2298acf9c14f79abdf7bae824eca96b78099dbed93c5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Brygada1918_wght_.ttf $out/share/fonts/truetype/Brygada1918_wght_.ttf
     install -Dm644 Brygada1918-Italic_wght_.ttf $out/share/fonts/truetype/Brygada1918-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Brygada 1918";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
