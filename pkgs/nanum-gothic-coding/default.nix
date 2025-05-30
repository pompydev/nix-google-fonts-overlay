{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nanum-gothic-coding-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/nanumgothiccoding/NanumGothicCoding-Regular.ttf?raw=true";
      name = "NanumGothicCoding-Regular.ttf";
      sha256 = "787effd7efed2abca88ade231faa8191f4e9fcf85b1805a13ee1dc3724b72089";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/nanumgothiccoding/NanumGothicCoding-Bold.ttf?raw=true";
      name = "NanumGothicCoding-Bold.ttf";
      sha256 = "77a6de97c176b76ef9a683b565a1e6f4ce40b499c72a2972c4b5bdf7c6b8e7a0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NanumGothicCoding-Regular.ttf $out/share/fonts/truetype/NanumGothicCoding-Regular.ttf
     install -Dm644 NanumGothicCoding-Bold.ttf $out/share/fonts/truetype/NanumGothicCoding-Bold.ttf
  '';

  meta = with lib; {
    description = "Nanum Gothic Coding";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
