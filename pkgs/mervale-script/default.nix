{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mervale-script-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/mervalescript/MervaleScript-Regular.ttf?raw=true";
      name = "MervaleScript-Regular.ttf";
      sha256 = "52522c4965b84bf5e56015bf919b165b7eedbaedb08d7d0d7477c38141c953d6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MervaleScript-Regular.ttf $out/share/fonts/truetype/MervaleScript-Regular.ttf
  '';

  meta = with lib; {
    description = "Mervale Script";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
