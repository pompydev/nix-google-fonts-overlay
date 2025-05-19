{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "offside-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/offside/Offside-Regular.ttf?raw=true";
      name = "Offside-Regular.ttf";
      sha256 = "996d1eb52d4922d9fdab7bb6d0b3525e99396254d4a7e1d5c3b182c6bf5450a9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Offside-Regular.ttf $out/share/fonts/truetype/Offside-Regular.ttf
  '';

  meta = with lib; {
    description = "Offside";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
