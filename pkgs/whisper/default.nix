{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "whisper-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/whisper/Whisper-Regular.ttf?raw=true";
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
