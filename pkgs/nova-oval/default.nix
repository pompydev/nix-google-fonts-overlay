{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nova-oval-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/novaoval/NovaOval.ttf?raw=true";
      name = "NovaOval.ttf";
      sha256 = "2ae90689c17afdcb69fd45325fc65cd98ca8d537a63ed2c33eed9827ac6a16f6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NovaOval.ttf $out/share/fonts/truetype/NovaOval.ttf
  '';

  meta = with lib; {
    description = "Nova Oval";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
