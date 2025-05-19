{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tulpen-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/tulpenone/TulpenOne-Regular.ttf?raw=true";
      name = "TulpenOne-Regular.ttf";
      sha256 = "b773d2fd30f5ef174560ce0fe05b05c6fa901e710236c4e9eea4c3f669580005";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 TulpenOne-Regular.ttf $out/share/fonts/truetype/TulpenOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Tulpen One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
