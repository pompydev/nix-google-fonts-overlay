{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "charis-sil-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/charissil/CharisSIL-Regular.ttf?raw=true";
      name = "CharisSIL-Regular.ttf";
      sha256 = "346337374aa347d64ee015b26d441f1970d8631914e2f3941b00e1c4761e28c5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/charissil/CharisSIL-Italic.ttf?raw=true";
      name = "CharisSIL-Italic.ttf";
      sha256 = "e776e2961117b39cf924c0139de01748a77b2fcb99c437b2c77bdd9401606c13";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/charissil/CharisSIL-Bold.ttf?raw=true";
      name = "CharisSIL-Bold.ttf";
      sha256 = "68460d2b76c8f781b49f9168f2c7dc3c9f7b788a3a1b8f267c5fa6bb47d5c64d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/charissil/CharisSIL-BoldItalic.ttf?raw=true";
      name = "CharisSIL-BoldItalic.ttf";
      sha256 = "acdf6dc54c0ee5e03cae3398f64133c335084cd1ecab655f2a8636c5d56acedb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CharisSIL-Regular.ttf $out/share/fonts/truetype/CharisSIL-Regular.ttf
     install -Dm644 CharisSIL-Italic.ttf $out/share/fonts/truetype/CharisSIL-Italic.ttf
     install -Dm644 CharisSIL-Bold.ttf $out/share/fonts/truetype/CharisSIL-Bold.ttf
     install -Dm644 CharisSIL-BoldItalic.ttf $out/share/fonts/truetype/CharisSIL-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Charis SIL";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
