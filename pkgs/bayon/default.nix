{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bayon-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bayon/Bayon-Regular.ttf?raw=true";
      name = "Bayon-Regular.ttf";
      sha256 = "ffdeb7ad5ca1abd37631b0a637aaa1b2cd695f85e582f5c75ccce26bdaaf51b6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Bayon-Regular.ttf $out/share/fonts/truetype/Bayon-Regular.ttf
  '';

  meta = with lib; {
    description = "Bayon";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
