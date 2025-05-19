{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "faustina-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/faustina/Faustina%5Bwght%5D.ttf?raw=true";
      name = "Faustina_wght_.ttf";
      sha256 = "2ce2606f0ee1d493873c24818a391e02606ee76ac924b3d985cbb820c0a53ea5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/faustina/Faustina-Italic%5Bwght%5D.ttf?raw=true";
      name = "Faustina-Italic_wght_.ttf";
      sha256 = "215b9bf63da0c9584b5a0aa8e2270da6a2b62c1281f5c39089613c3aaeffa2be";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Faustina_wght_.ttf $out/share/fonts/truetype/Faustina_wght_.ttf
     install -Dm644 Faustina-Italic_wght_.ttf $out/share/fonts/truetype/Faustina-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Faustina";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
