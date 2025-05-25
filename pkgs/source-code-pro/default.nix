{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "source-code-pro-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/sourcecodepro/SourceCodePro%5Bwght%5D.ttf?raw=true";
      name = "SourceCodePro_wght_.ttf";
      sha256 = "b400fc584e10aff25d0e775ce181b4fc1c5ea1b5dc37b81aeb2084375b945790";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/sourcecodepro/SourceCodePro-Italic%5Bwght%5D.ttf?raw=true";
      name = "SourceCodePro-Italic_wght_.ttf";
      sha256 = "6db77d25aa7b30eff449305b5c998e475694c74d398421127ea5a60f536413cd";
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
