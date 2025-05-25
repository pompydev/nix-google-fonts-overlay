{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tiro-telugu-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/tirotelugu/TiroTelugu-Regular.ttf?raw=true";
      name = "TiroTelugu-Regular.ttf";
      sha256 = "aefd72a31b1a9d726047d3dc34568f0aacc3a5048971f73d3228d4d2a6087240";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/tirotelugu/TiroTelugu-Italic.ttf?raw=true";
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
