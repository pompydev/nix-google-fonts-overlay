{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "prociono-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/prociono/Prociono-Regular.ttf?raw=true";
      name = "Prociono-Regular.ttf";
      sha256 = "cfc641117fe748d9958d9891702692da61bf86917de5039a0b31d30f78ce427a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Prociono-Regular.ttf $out/share/fonts/truetype/Prociono-Regular.ttf
  '';

  meta = with lib; {
    description = "Prociono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
