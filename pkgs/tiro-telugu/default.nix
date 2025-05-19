{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tiro-telugu-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/tirotelugu/TiroTelugu-Regular.ttf?raw=true";
      name = "TiroTelugu-Regular.ttf";
      sha256 = "aefd72a31b1a9d726047d3dc34568f0aacc3a5048971f73d3228d4d2a6087240";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/tirotelugu/TiroTelugu-Italic.ttf?raw=true";
      name = "TiroTelugu-Italic.ttf";
      sha256 = "8f15489b577de6f135113df186ca09440adeba233999ad345cf16f7fc1bd766b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 TiroTelugu-Regular.ttf $out/share/fonts/truetype/TiroTelugu-Regular.ttf
     install -Dm644 TiroTelugu-Italic.ttf $out/share/fonts/truetype/TiroTelugu-Italic.ttf
  '';

  meta = with lib; {
    description = "Tiro Telugu";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
