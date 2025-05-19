{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "overlock-sc-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/overlocksc/OverlockSC-Regular.ttf?raw=true";
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
