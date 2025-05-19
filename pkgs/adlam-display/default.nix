{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "adlam-display-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/adlamdisplay/ADLaMDisplay-Regular.ttf?raw=true";
      name = "ADLaMDisplay-Regular.ttf";
      sha256 = "cc36c3c6cba02522b86ef6c5ee7b062c5bf2a60b0f51f9b87a44c7d50d650899";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ADLaMDisplay-Regular.ttf $out/share/fonts/truetype/ADLaMDisplay-Regular.ttf
  '';

  meta = with lib; {
    description = "ADLaM Display";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
