{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "akshar-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/akshar/Akshar%5Bwght%5D.ttf?raw=true";
      name = "Akshar_wght_.ttf";
      sha256 = "5288f970076f57f158dba767f44aec8f8e852920f1a3cc20a3268420ad9ec251";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Akshar_wght_.ttf $out/share/fonts/truetype/Akshar_wght_.ttf
  '';

  meta = with lib; {
    description = "Akshar";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
