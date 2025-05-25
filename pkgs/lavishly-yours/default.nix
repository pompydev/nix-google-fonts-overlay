{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lavishly-yours-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lavishlyyours/LavishlyYours-Regular.ttf?raw=true";
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
