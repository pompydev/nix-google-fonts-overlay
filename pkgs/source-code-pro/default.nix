{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "source-code-pro-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/04b9cc0b96616b190802646dc9a6d51a25d428de/ofl/sourcecodepro/SourceCodePro[wght].ttf?raw=true";
      name = "SourceCodePro_wght_.ttf";
      sha256 = "be88a2e3c368311c6ff8f62b043bb11addd696048582719253b681b8c8029aef";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/04b9cc0b96616b190802646dc9a6d51a25d428de/ofl/sourcecodepro/SourceCodePro-Italic[wght].ttf?raw=true";
      name = "SourceCodePro-Italic_wght_.ttf";
      sha256 = "17a14e2460d871f6e55361b16be173f28448b1af9241e2781ae60cf57aa40812";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SourceCodePro_wght_.ttf $out/share/fonts/truetype/SourceCodePro_wght_.ttf
     install -Dm644 SourceCodePro-Italic_wght_.ttf $out/share/fonts/truetype/SourceCodePro-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Source Code Pro";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
