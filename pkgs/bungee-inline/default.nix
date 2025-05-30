{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bungee-inline-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bungeeinline/BungeeInline-Regular.ttf?raw=true";
      name = "BungeeInline-Regular.ttf";
      sha256 = "5a07361627376971fa195e8500ec0fc5e0daf7df2f94ba8eb30d1b10ed7e0375";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BungeeInline-Regular.ttf $out/share/fonts/truetype/BungeeInline-Regular.ttf
  '';

  meta = with lib; {
    description = "Bungee Inline";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
