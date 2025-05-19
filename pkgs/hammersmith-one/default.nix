{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hammersmith-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/hammersmithone/HammersmithOne-Regular.ttf?raw=true";
      name = "HammersmithOne-Regular.ttf";
      sha256 = "6faf4e9a59a2b25e1016c4e47cf4da4a494d07aee15dc2f708a88caae015ff8a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 HammersmithOne-Regular.ttf $out/share/fonts/truetype/HammersmithOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Hammersmith One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
