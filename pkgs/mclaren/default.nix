{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mclaren-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/mclaren/McLaren-Regular.ttf?raw=true";
      name = "McLaren-Regular.ttf";
      sha256 = "3164e0dbdaa761e9a6bc1dff3532a3b3f631b6f2137c09847b2a7514e4bdc4ef";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 McLaren-Regular.ttf $out/share/fonts/truetype/McLaren-Regular.ttf
  '';

  meta = with lib; {
    description = "McLaren";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
