{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "audiowide-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/audiowide/Audiowide-Regular.ttf?raw=true";
      name = "Audiowide-Regular.ttf";
      sha256 = "c7c0f2b0f6fad8c623e31772ce79f94a4edb9321ffce9fce978ea892d20ae730";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Audiowide-Regular.ttf $out/share/fonts/truetype/Audiowide-Regular.ttf
  '';

  meta = with lib; {
    description = "Audiowide";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
