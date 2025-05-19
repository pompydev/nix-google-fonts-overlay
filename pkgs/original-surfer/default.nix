{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "original-surfer-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/originalsurfer/OriginalSurfer-Regular.ttf?raw=true";
      name = "OriginalSurfer-Regular.ttf";
      sha256 = "ee4a42820b224a1934f2ba0997958d7965ad34762d88244fbffddb0b0ae488e4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 OriginalSurfer-Regular.ttf $out/share/fonts/truetype/OriginalSurfer-Regular.ttf
  '';

  meta = with lib; {
    description = "Original Surfer";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
