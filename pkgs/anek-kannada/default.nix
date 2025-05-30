{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "anek-kannada-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/anekkannada/AnekKannada%5Bwdth,wght%5D.ttf?raw=true";
      name = "AnekKannada_wdth,wght_.ttf";
      sha256 = "6808783ecb95edd948c928ff394953256eed78bdb71dd1fd96eccaa4da05a330";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AnekKannada_wdth-wght_.ttf $out/share/fonts/truetype/AnekKannada_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Anek Kannada";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
