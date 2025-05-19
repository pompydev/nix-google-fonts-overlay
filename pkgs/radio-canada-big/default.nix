{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "radio-canada-big-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/radiocanadabig/RadioCanadaBig%5Bwght%5D.ttf?raw=true";
      name = "RadioCanadaBig_wght_.ttf";
      sha256 = "9d7fc9bd74b5d27e48bba194ed2993f054ebc9672463dc5f14bf1907932341d8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/radiocanadabig/RadioCanadaBig-Italic%5Bwght%5D.ttf?raw=true";
      name = "RadioCanadaBig-Italic_wght_.ttf";
      sha256 = "0bb4d0d21d3e312415c9703df39099eb06e1129af970bb4daa2454c0edcb882d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RadioCanadaBig_wght_.ttf $out/share/fonts/truetype/RadioCanadaBig_wght_.ttf
     install -Dm644 RadioCanadaBig-Italic_wght_.ttf $out/share/fonts/truetype/RadioCanadaBig-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Radio Canada Big";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
