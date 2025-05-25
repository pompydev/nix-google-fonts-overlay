{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "vazirmatn-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/vazirmatn/Vazirmatn%5Bwght%5D.ttf?raw=true";
      name = "Vazirmatn_wght_.ttf";
      sha256 = "696249a2c74b39ffdef55de4df2809c5b639d3ff80d618d8160a095d2fd49dca";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Vazirmatn_wght_.ttf $out/share/fonts/truetype/Vazirmatn_wght_.ttf
  '';

  meta = with lib; {
    description = "Vazirmatn";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
