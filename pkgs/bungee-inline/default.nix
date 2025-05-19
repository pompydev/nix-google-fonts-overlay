{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bungee-inline-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bungeeinline/BungeeInline-Regular.ttf?raw=true";
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
