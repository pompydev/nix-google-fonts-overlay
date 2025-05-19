{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoserif/NotoSerif%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSerif_wdth,wght_.ttf";
      sha256 = "4d8e6761424656867019081a1a01336f3cb086982682698714054fc33f782713";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoserif/NotoSerif-Italic%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSerif-Italic_wdth,wght_.ttf";
      sha256 = "e87acbc6c0efd0d9a20d6a8cbbda2b266c14be3a3a6f5af8ec9d7b2460570ad1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerif_wdth,wght_.ttf $out/share/fonts/truetype/NotoSerif_wdth,wght_.ttf
     install -Dm644 NotoSerif-Italic_wdth,wght_.ttf $out/share/fonts/truetype/NotoSerif-Italic_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
