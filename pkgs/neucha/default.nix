{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "neucha-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/neucha/Neucha.ttf?raw=true";
      name = "Neucha.ttf";
      sha256 = "7927bd6ce090fa032857dcbc3ad0e8b765c462d0a72a8779068132496b4e087d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Neucha.ttf $out/share/fonts/truetype/Neucha.ttf
  '';

  meta = with lib; {
    description = "Neucha";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
