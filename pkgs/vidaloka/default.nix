{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "vidaloka-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/vidaloka/Vidaloka-Regular.ttf?raw=true";
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
