{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "anek-devanagari-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/anekdevanagari/AnekDevanagari%5Bwdth,wght%5D.ttf?raw=true";
      name = "AnekDevanagari_wdth,wght_.ttf";
      sha256 = "b88cf0ff5705599b2f16fce4ba9ce2029f76106dd24f0419976c417d89f20888";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AnekDevanagari_wdth-wght_.ttf $out/share/fonts/truetype/AnekDevanagari_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Anek Devanagari";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
