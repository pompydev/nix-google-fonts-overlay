{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "harmattan-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7028be6bbe82a4e5fd97acca2fe02915fd2c80d6/ofl/harmattan/Harmattan-Regular.ttf?raw=true";
      name = "Harmattan-Regular.ttf";
      sha256 = "6aeaeb33a1f0775e1f206b8692a1f2b031ae093ab267c382b99d6c7bf085f2eb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7028be6bbe82a4e5fd97acca2fe02915fd2c80d6/ofl/harmattan/Harmattan-Bold.ttf?raw=true";
      name = "Harmattan-Bold.ttf";
      sha256 = "22432ecd64834ed1bae59c457836b6d978e1364f2a148883b06243ab01caea70";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Harmattan-Regular.ttf $out/share/fonts/truetype/Harmattan-Regular.ttf
     install -Dm644 Harmattan-Bold.ttf $out/share/fonts/truetype/Harmattan-Bold.ttf
  '';

  meta = with lib; {
    description = "Harmattan";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
