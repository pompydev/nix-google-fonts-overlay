{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-inscriptional-parthian-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansinscriptionalparthian/NotoSansInscriptionalParthian-Regular.ttf?raw=true";
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
