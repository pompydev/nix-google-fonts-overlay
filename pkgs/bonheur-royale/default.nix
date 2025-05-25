{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bonheur-royale-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bonheurroyale/BonheurRoyale-Regular.ttf?raw=true";
      name = "BonheurRoyale-Regular.ttf";
      sha256 = "c37f2847c2d726e254762afe26354ed6d9b9ac88caa4c3473a89eef359fd2878";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BonheurRoyale-Regular.ttf $out/share/fonts/truetype/BonheurRoyale-Regular.ttf
  '';

  meta = with lib; {
    description = "Bonheur Royale";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
