{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hammersmith-one-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ff6fd2655deb043f1aee47a842525ad6533e0268/ofl/hammersmithone/HammersmithOne-Regular.ttf?raw=true";
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
