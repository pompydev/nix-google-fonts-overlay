{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "red-hat-text-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/redhattext/RedHatText%5Bwght%5D.ttf?raw=true";
      name = "RedHatText_wght_.ttf";
      sha256 = "52343c51f688537b72967b78a7883ac29d96d698e0f0707bb11bac1987e0855d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/redhattext/RedHatText-Italic%5Bwght%5D.ttf?raw=true";
      name = "RedHatText-Italic_wght_.ttf";
      sha256 = "e7c263cf563dbd9fea7567839e22f3e34ed21234bd0a9b057402f921d1b1fa7e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RedHatText_wght_.ttf $out/share/fonts/truetype/RedHatText_wght_.ttf
     install -Dm644 RedHatText-Italic_wght_.ttf $out/share/fonts/truetype/RedHatText-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Red Hat Text";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
