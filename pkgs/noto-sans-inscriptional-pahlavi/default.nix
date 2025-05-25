{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-inscriptional-pahlavi-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansinscriptionalpahlavi/NotoSansInscriptionalPahlavi-Regular.ttf?raw=true";
      name = "NotoSansInscriptionalPahlavi-Regular.ttf";
      sha256 = "96aa13745c70634bc902662aaa2a665818d277b04d3318992346c54954237cd6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansInscriptionalPahlavi-Regular.ttf $out/share/fonts/truetype/NotoSansInscriptionalPahlavi-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Inscriptional Pahlavi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
