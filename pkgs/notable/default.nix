{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "notable-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notable/Notable-Regular.ttf?raw=true";
      name = "Notable-Regular.ttf";
      sha256 = "fe5105a1e0b5c4daf1ea10730aac2fbbeaec3a6431e67eb827bf56e3a966d3c6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Notable-Regular.ttf $out/share/fonts/truetype/Notable-Regular.ttf
  '';

  meta = with lib; {
    description = "Notable";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
