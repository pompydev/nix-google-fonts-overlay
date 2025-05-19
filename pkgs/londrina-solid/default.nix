{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "londrina-solid-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/londrinasolid/LondrinaSolid-Thin.ttf?raw=true";
      name = "LondrinaSolid-Thin.ttf";
      sha256 = "77761d803e937ec42a7f4b3be80ca15212a7d592dc10022838dc11df8e15fdb5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/londrinasolid/LondrinaSolid-Light.ttf?raw=true";
      name = "LondrinaSolid-Light.ttf";
      sha256 = "fc6f2572d00807895ac2ffe2c5cffb9fb107ccb75cdb62b5d159d7c9c81591a1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/londrinasolid/LondrinaSolid-Regular.ttf?raw=true";
      name = "LondrinaSolid-Regular.ttf";
      sha256 = "e82b9b3ee21ccf153dcf67e5f4226a210474591a6ad31b5f17f2f14dc2524514";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/londrinasolid/LondrinaSolid-Black.ttf?raw=true";
      name = "LondrinaSolid-Black.ttf";
      sha256 = "8c63a15e3fa34e0b362abeb903944a2bd45e71b1efa122486c0a47e295eae06f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LondrinaSolid-Thin.ttf $out/share/fonts/truetype/LondrinaSolid-Thin.ttf
     install -Dm644 LondrinaSolid-Light.ttf $out/share/fonts/truetype/LondrinaSolid-Light.ttf
     install -Dm644 LondrinaSolid-Regular.ttf $out/share/fonts/truetype/LondrinaSolid-Regular.ttf
     install -Dm644 LondrinaSolid-Black.ttf $out/share/fonts/truetype/LondrinaSolid-Black.ttf
  '';

  meta = with lib; {
    description = "Londrina Solid";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
