{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lavishly-yours-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/lavishlyyours/LavishlyYours-Regular.ttf?raw=true";
      name = "LavishlyYours-Regular.ttf";
      sha256 = "4a07a5002a4f852952818eebdcf008e48ea7d537541cc8ff7eb842088842313e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LavishlyYours-Regular.ttf $out/share/fonts/truetype/LavishlyYours-Regular.ttf
  '';

  meta = with lib; {
    description = "Lavishly Yours";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
