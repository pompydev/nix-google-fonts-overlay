{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-inscriptional-pahlavi-${version}";
  version = "2022-05-24-065742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansinscriptionalpahlavi/NotoSansInscriptionalPahlavi-Regular.ttf?raw=true";
      name = "NotoSansInscriptionalPahlavi-Regular.ttf";
      sha256 = "f5cf7e0d349edb45a9573ae9d1dd683977f0eef1794066fa9a29bdbb65abcf74";
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
