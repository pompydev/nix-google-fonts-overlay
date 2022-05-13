{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-balinese-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notoserifbalinese/NotoSerifBalinese-Regular.ttf?raw=true";
      name = "NotoSerifBalinese-Regular.ttf";
      sha256 = "1bf8d4f3e8615b0cacb92ffcf5b694256ba1f3813fa05b0871ad8f1e9a0e4377";
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
