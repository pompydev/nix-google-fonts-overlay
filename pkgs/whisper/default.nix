{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "whisper-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/21635fa33f706273ffadc353d1c2f4a0b35e13cd/ofl/whisper/Whisper-Regular.ttf?raw=true";
      name = "Whisper-Regular.ttf";
      sha256 = "f1f415a0de888897ab638fe6a0547406ecc469901d26afd06af619ddb4c623ec";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Whisper-Regular.ttf $out/share/fonts/truetype/Whisper-Regular.ttf
  '';

  meta = with lib; {
    description = "Whisper";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
