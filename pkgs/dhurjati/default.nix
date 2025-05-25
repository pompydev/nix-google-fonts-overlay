{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "dhurjati-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/dhurjati/Dhurjati-Regular.ttf?raw=true";
      name = "Dhurjati-Regular.ttf";
      sha256 = "7f82ab141b77d263f9ea9b31b47faf50c11310f42fce6d9dffeaaa334909bbf9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Dhurjati-Regular.ttf $out/share/fonts/truetype/Dhurjati-Regular.ttf
  '';

  meta = with lib; {
    description = "Dhurjati";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
