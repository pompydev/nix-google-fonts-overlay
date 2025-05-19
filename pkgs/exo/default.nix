{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "exo-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/exo/Exo%5Bwght%5D.ttf?raw=true";
      name = "Exo_wght_.ttf";
      sha256 = "2f08f818f1135ac5798030c0bca252c0845af5c54dfe172a5c74fbdd68843445";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/exo/Exo-Italic%5Bwght%5D.ttf?raw=true";
      name = "Exo-Italic_wght_.ttf";
      sha256 = "062aca9ab9aa4a9e004e8d679e84aca6ef0cdcabb2fac3b27a73808e04bed9b4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Exo_wght_.ttf $out/share/fonts/truetype/Exo_wght_.ttf
     install -Dm644 Exo-Italic_wght_.ttf $out/share/fonts/truetype/Exo-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Exo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
