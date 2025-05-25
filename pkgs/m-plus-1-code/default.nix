{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "m-plus-1-code-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/mplus1code/MPLUS1Code%5Bwght%5D.ttf?raw=true";
      name = "MPLUS1Code_wght_.ttf";
      sha256 = "5a8b90c4d0e46c0dfd11eb951303ddc6ab5fba1f77a2ff1184133eed271f9723";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MPLUS1Code_wght_.ttf $out/share/fonts/truetype/MPLUS1Code_wght_.ttf
  '';

  meta = with lib; {
    description = "M PLUS 1 Code";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
