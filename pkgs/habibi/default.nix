{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "habibi-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/habibi/Habibi-Regular.ttf?raw=true";
      name = "Habibi-Regular.ttf";
      sha256 = "65ae905bf98ae8ca0ec67786d01cdc1add55759dbb8b99e7da0d368f9ea74671";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Habibi-Regular.ttf $out/share/fonts/truetype/Habibi-Regular.ttf
  '';

  meta = with lib; {
    description = "Habibi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
