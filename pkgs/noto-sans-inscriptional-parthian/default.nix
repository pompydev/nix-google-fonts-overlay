{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-inscriptional-parthian-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansinscriptionalparthian/NotoSansInscriptionalParthian-Regular.ttf?raw=true";
      name = "NotoSansInscriptionalParthian-Regular.ttf";
      sha256 = "a3b80af8a1927189a353b03075cbebd454291519dfc60a325070d6f405f5ba50";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansInscriptionalParthian-Regular.ttf $out/share/fonts/truetype/NotoSansInscriptionalParthian-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Inscriptional Parthian";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
