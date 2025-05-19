{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cascadia-code-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/cascadiacode/CascadiaCode%5Bwght%5D.ttf?raw=true";
      name = "CascadiaCode_wght_.ttf";
      sha256 = "30f2e14a5c389b346b1fce110c4ddcf0dc5ce8265faf5eca2ab7323f49dba590";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/cascadiacode/CascadiaCode-Italic%5Bwght%5D.ttf?raw=true";
      name = "CascadiaCode-Italic_wght_.ttf";
      sha256 = "33559b4beb60523b824e25a416b5de2779a9bc7c7ce32ce128490b42acbf4681";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CascadiaCode_wght_.ttf $out/share/fonts/truetype/CascadiaCode_wght_.ttf
     install -Dm644 CascadiaCode-Italic_wght_.ttf $out/share/fonts/truetype/CascadiaCode-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Cascadia Code";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
