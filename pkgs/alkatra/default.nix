{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "alkatra-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/alkatra/Alkatra%5Bwght%5D.ttf?raw=true";
      name = "Alkatra_wght_.ttf";
      sha256 = "af6d39e8085eda5db66b19100571709bd41c41938400f2c365dadde86dd28466";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Alkatra_wght_.ttf $out/share/fonts/truetype/Alkatra_wght_.ttf
  '';

  meta = with lib; {
    description = "Alkatra";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
