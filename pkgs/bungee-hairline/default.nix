{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bungee-hairline-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bungeehairline/BungeeHairline-Regular.ttf?raw=true";
      name = "BungeeHairline-Regular.ttf";
      sha256 = "fa720052780a73c9e8ba196bbb5332d361d366624f13f486beff125097fdbfb2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BungeeHairline-Regular.ttf $out/share/fonts/truetype/BungeeHairline-Regular.ttf
  '';

  meta = with lib; {
    description = "Bungee Hairline";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
