{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-balinese-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notoserifbalinese/NotoSerifBalinese-Regular.ttf?raw=true";
      name = "NotoSerifBalinese-Regular.ttf";
      sha256 = "781c98b8d5ff17e9647442f2d2e931c2033df17b3ce63cb376fc9b6c8ede05d4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifBalinese-Regular.ttf $out/share/fonts/truetype/NotoSerifBalinese-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Balinese";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
