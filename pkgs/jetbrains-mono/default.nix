{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jetbrains-mono-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/jetbrainsmono/JetBrainsMono%5Bwght%5D.ttf?raw=true";
      name = "JetBrainsMono_wght_.ttf";
      sha256 = "48715a42ec242c21e9f02692891e147d022299a52e48d5e413e1a942193ffeda";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/jetbrainsmono/JetBrainsMono-Italic%5Bwght%5D.ttf?raw=true";
      name = "JetBrainsMono-Italic_wght_.ttf";
      sha256 = "85ae2a5cd3f56baf1ce1c21a851322c58e3d8fbe8e8ad4a4d090a820dd7fe558";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 JetBrainsMono_wght_.ttf $out/share/fonts/truetype/JetBrainsMono_wght_.ttf
     install -Dm644 JetBrainsMono-Italic_wght_.ttf $out/share/fonts/truetype/JetBrainsMono-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "JetBrains Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
