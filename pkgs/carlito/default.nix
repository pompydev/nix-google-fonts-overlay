{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "carlito-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/carlito/Carlito-Regular.ttf?raw=true";
      name = "Carlito-Regular.ttf";
      sha256 = "f6418f708baede9789daef5d458c0f53d2a888af9820e8062934e504fedc6595";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/carlito/Carlito-Italic.ttf?raw=true";
      name = "Carlito-Italic.ttf";
      sha256 = "0b019225e58d702bfedcbd35c21696769f8ee115cb6343f84c2f240312450d1c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/carlito/Carlito-Bold.ttf?raw=true";
      name = "Carlito-Bold.ttf";
      sha256 = "bb5d20f79b82599ec72983597437373a80f2d2085fa91fc144fd74e876a594db";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/carlito/Carlito-BoldItalic.ttf?raw=true";
      name = "Carlito-BoldItalic.ttf";
      sha256 = "b32928186c119599e03ca6a1ffc680fdcb7fac95772f4b95d989cf6cd3861517";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Carlito-Regular.ttf $out/share/fonts/truetype/Carlito-Regular.ttf
     install -Dm644 Carlito-Italic.ttf $out/share/fonts/truetype/Carlito-Italic.ttf
     install -Dm644 Carlito-Bold.ttf $out/share/fonts/truetype/Carlito-Bold.ttf
     install -Dm644 Carlito-BoldItalic.ttf $out/share/fonts/truetype/Carlito-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Carlito";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
