{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "overlock-sc-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/overlocksc/OverlockSC-Regular.ttf?raw=true";
      name = "OverlockSC-Regular.ttf";
      sha256 = "35432623a400a074e3931b7c4958e00479cbdfa8484a23f6fbba8dfc94976675";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 OverlockSC-Regular.ttf $out/share/fonts/truetype/OverlockSC-Regular.ttf
  '';

  meta = with lib; {
    description = "Overlock SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
