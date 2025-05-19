{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-iso-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/rubikiso/RubikIso-Regular.ttf?raw=true";
      name = "RubikIso-Regular.ttf";
      sha256 = "b3d774e88798b202a354bcbe7f14180c2c76596baa0f1bb8445c53683e8a511b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RubikIso-Regular.ttf $out/share/fonts/truetype/RubikIso-Regular.ttf
  '';

  meta = with lib; {
    description = "Rubik Iso";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
