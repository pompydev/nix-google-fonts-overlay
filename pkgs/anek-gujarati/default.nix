{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "anek-gujarati-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d3ec5576954cf3e400faf38e61bcdbe06b082197/ofl/anekgujarati/AnekGujarati%5Bwdth,wght%5D.ttf?raw=true";
      name = "AnekGujarati_wdth,wght_.ttf";
      sha256 = "7d68cf90804e69cd23717f9f5485f4ac10b660096ab0b406e86f32e09d96029b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AnekGujarati_wdth,wght_.ttf $out/share/fonts/truetype/AnekGujarati_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Anek Gujarati";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
