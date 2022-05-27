{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "baloo-da-2-${version}";
  version = "2022-05-23-211740";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9104fa8b6299c9de3d70e0a9dbe471cc7d5b5743/ofl/balooda2/BalooDa2%5Bwght%5D.ttf?raw=true";
      name = "BalooDa2_wght_.ttf";
      sha256 = "8b62a8c4dbe659be5e4d40c19b7b3012120335b333205c5aa101b45cdb449cff";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BalooDa2_wght_.ttf $out/share/fonts/truetype/BalooDa2_wght_.ttf
  '';

  meta = with lib; {
    description = "Baloo Da 2";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
