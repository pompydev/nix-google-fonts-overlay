{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "chenla-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/84b31698cb643dd35af5cf4567974d98e57ff2ac/ofl/chenla/Chenla.ttf?raw=true";
      name = "Chenla.ttf";
      sha256 = "0174cda2c7718e129b9f2599cd7dd9265b01a63b9acf67f939882f0fddff29b7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Chenla.ttf $out/share/fonts/truetype/Chenla.ttf
  '';

  meta = with lib; {
    description = "Chenla";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
