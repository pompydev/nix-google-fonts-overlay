{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "agbalumo-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/agbalumo/Agbalumo-Regular.ttf?raw=true";
      name = "Agbalumo-Regular.ttf";
      sha256 = "02fd8b71c067d2f5f4a9d83ddc09c7377d3c853f94e712afdf4a49a7c20306f4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Agbalumo-Regular.ttf $out/share/fonts/truetype/Agbalumo-Regular.ttf
  '';

  meta = with lib; {
    description = "Agbalumo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
