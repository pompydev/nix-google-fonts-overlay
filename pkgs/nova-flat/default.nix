{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nova-flat-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/novaflat/NovaFlat.ttf?raw=true";
      name = "NovaFlat.ttf";
      sha256 = "de302932cdca6d274f7f791b9805d6e0f84ec44ae6ed630f1b1e8c616fc04c42";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NovaFlat.ttf $out/share/fonts/truetype/NovaFlat.ttf
  '';

  meta = with lib; {
    description = "Nova Flat";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
