{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tulpen-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/tulpenone/TulpenOne-Regular.ttf?raw=true";
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
