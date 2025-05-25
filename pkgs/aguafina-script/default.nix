{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "aguafina-script-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/aguafinascript/AguafinaScript-Regular.ttf?raw=true";
      name = "AguafinaScript-Regular.ttf";
      sha256 = "55f65d84d86936d7aaadffa4c17873923fba26c078d42aa4e6e2f1be8bfb5f6e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AguafinaScript-Regular.ttf $out/share/fonts/truetype/AguafinaScript-Regular.ttf
  '';

  meta = with lib; {
    description = "Aguafina Script";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
