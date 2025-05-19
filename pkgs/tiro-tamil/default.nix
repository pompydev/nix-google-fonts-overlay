{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tiro-tamil-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/tirotamil/TiroTamil-Regular.ttf?raw=true";
      name = "TiroTamil-Regular.ttf";
      sha256 = "f4ad26a93893a45fcb44bf117940d462c5aef1887543e9b8bf150767e597a76f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/tirotamil/TiroTamil-Italic.ttf?raw=true";
      name = "TiroTamil-Italic.ttf";
      sha256 = "9571f0048b9f25411ff020ec037d2c7e257c5fc2b043c18533e305ea4aa193e6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 TiroTamil-Regular.ttf $out/share/fonts/truetype/TiroTamil-Regular.ttf
     install -Dm644 TiroTamil-Italic.ttf $out/share/fonts/truetype/TiroTamil-Italic.ttf
  '';

  meta = with lib; {
    description = "Tiro Tamil";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
