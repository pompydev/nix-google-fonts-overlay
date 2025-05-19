{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "suravaram-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/suravaram/Suravaram-Regular.ttf?raw=true";
      name = "Suravaram-Regular.ttf";
      sha256 = "67c8e0d9e78c3eef2924bfe54b7462e9875ff42fe37abbe3e601ad6a9ada0f9c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Suravaram-Regular.ttf $out/share/fonts/truetype/Suravaram-Regular.ttf
  '';

  meta = with lib; {
    description = "Suravaram";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
