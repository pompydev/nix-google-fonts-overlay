{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "spinnaker-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/spinnaker/Spinnaker-Regular.ttf?raw=true";
      name = "Spinnaker-Regular.ttf";
      sha256 = "f89852fb1cbf415eac1893d98978d77b934475d53d46838fd146924a4d2e13fc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Spinnaker-Regular.ttf $out/share/fonts/truetype/Spinnaker-Regular.ttf
  '';

  meta = with lib; {
    description = "Spinnaker";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
