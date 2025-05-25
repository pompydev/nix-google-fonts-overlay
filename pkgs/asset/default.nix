{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "asset-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/asset/Asset-Regular.ttf?raw=true";
      name = "Asset-Regular.ttf";
      sha256 = "1dac444192904730f28fbbb10a5ca7a629fe38e4717e026fdfea50ed69bef920";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Asset-Regular.ttf $out/share/fonts/truetype/Asset-Regular.ttf
  '';

  meta = with lib; {
    description = "Asset";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
