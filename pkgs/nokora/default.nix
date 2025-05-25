{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nokora-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/nokora/Nokora%5Bwght%5D.ttf?raw=true";
      name = "Nokora_wght_.ttf";
      sha256 = "ecdba2c8abcf872422daf61eab12180f2c49b09b325288a447de08d3081dc0ca";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Nokora_wght_.ttf $out/share/fonts/truetype/Nokora_wght_.ttf
  '';

  meta = with lib; {
    description = "Nokora";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
