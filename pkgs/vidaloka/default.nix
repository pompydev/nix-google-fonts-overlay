{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "vidaloka-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/023aa4b2855c95413d1b1c510ad812beb345df75/ofl/vidaloka/Vidaloka-Regular.ttf?raw=true";
      name = "Vidaloka-Regular.ttf";
      sha256 = "5e90b4016da17f26a2f653bd9468bbb7e7b081f40c11ff5c24088420edc4dbe2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Vidaloka-Regular.ttf $out/share/fonts/truetype/Vidaloka-Regular.ttf
  '';

  meta = with lib; {
    description = "Vidaloka";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
