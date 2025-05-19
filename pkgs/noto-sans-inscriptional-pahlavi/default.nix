{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-inscriptional-pahlavi-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansinscriptionalpahlavi/NotoSansInscriptionalPahlavi-Regular.ttf?raw=true";
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
