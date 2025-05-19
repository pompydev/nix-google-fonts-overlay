{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "give-you-glory-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/giveyouglory/GiveYouGlory.ttf?raw=true";
      name = "GiveYouGlory.ttf";
      sha256 = "fb71f9a46a3234c2d98dbbe44e711f65654368031c57b927bf7679a46e278c80";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GiveYouGlory.ttf $out/share/fonts/truetype/GiveYouGlory.ttf
  '';

  meta = with lib; {
    description = "Give You Glory";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
