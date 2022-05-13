{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "simonetta-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b01c90e22bfc54d55390c48ce206f1baaba0807d/ofl/simonetta/Simonetta-Regular.ttf?raw=true";
      name = "Simonetta-Regular.ttf";
      sha256 = "96d14d9f8c8af857dc64beaf4cee297f22d7992a463cfff3e30928b5d5572ef6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b01c90e22bfc54d55390c48ce206f1baaba0807d/ofl/simonetta/Simonetta-Italic.ttf?raw=true";
      name = "Simonetta-Italic.ttf";
      sha256 = "89164679cf426fb50185be14d9673c8ca35e429a0308f06393988c20dcfb9c20";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b01c90e22bfc54d55390c48ce206f1baaba0807d/ofl/simonetta/Simonetta-Black.ttf?raw=true";
      name = "Simonetta-Black.ttf";
      sha256 = "c5912a33c419048c6fe0bc44303bba3a987a122bfb4c733750d71dafd0841b1b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b01c90e22bfc54d55390c48ce206f1baaba0807d/ofl/simonetta/Simonetta-BlackItalic.ttf?raw=true";
      name = "Simonetta-BlackItalic.ttf";
      sha256 = "924b6b7f82552c11579037bb6906bbbcf783d01488de9278977cbbe4b44948a7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Simonetta-Regular.ttf $out/share/fonts/truetype/Simonetta-Regular.ttf
     install -Dm644 Simonetta-Italic.ttf $out/share/fonts/truetype/Simonetta-Italic.ttf
     install -Dm644 Simonetta-Black.ttf $out/share/fonts/truetype/Simonetta-Black.ttf
     install -Dm644 Simonetta-BlackItalic.ttf $out/share/fonts/truetype/Simonetta-BlackItalic.ttf
  '';

  meta = with lib; {
    description = "Simonetta";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
