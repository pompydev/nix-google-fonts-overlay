{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bellota-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bellota/Bellota-Light.ttf?raw=true";
      name = "Bellota-Light.ttf";
      sha256 = "18d184f3598bae830082041cf7fb49a24d0dee605de2b52e4ae68bded698df0a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bellota/Bellota-LightItalic.ttf?raw=true";
      name = "Bellota-LightItalic.ttf";
      sha256 = "6f61044daac01399bd7d1fd00c2ccfeb6b916f10f4c96a303e1a1007bb48e17d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bellota/Bellota-Regular.ttf?raw=true";
      name = "Bellota-Regular.ttf";
      sha256 = "d46806f9c5fd46cd6bf1c261bfa46b2d22503130d585451dc7863d8ce80524fc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bellota/Bellota-Italic.ttf?raw=true";
      name = "Bellota-Italic.ttf";
      sha256 = "8e1ae4d9fa4e055e9fc202be586f8a9a5bef81d8731bdd40bd862df2071edb99";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bellota/Bellota-Bold.ttf?raw=true";
      name = "Bellota-Bold.ttf";
      sha256 = "2120a9b5c3c92e7fe7cf4e964e925ac04cb013c63ac72da4a756ae6ed872e97b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bellota/Bellota-BoldItalic.ttf?raw=true";
      name = "Bellota-BoldItalic.ttf";
      sha256 = "82caafa69ed7cd8ab3723b2c8eedb443be908f9088e57ffcde0b5f0d38dc3708";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Bellota-Light.ttf $out/share/fonts/truetype/Bellota-Light.ttf
     install -Dm644 Bellota-LightItalic.ttf $out/share/fonts/truetype/Bellota-LightItalic.ttf
     install -Dm644 Bellota-Regular.ttf $out/share/fonts/truetype/Bellota-Regular.ttf
     install -Dm644 Bellota-Italic.ttf $out/share/fonts/truetype/Bellota-Italic.ttf
     install -Dm644 Bellota-Bold.ttf $out/share/fonts/truetype/Bellota-Bold.ttf
     install -Dm644 Bellota-BoldItalic.ttf $out/share/fonts/truetype/Bellota-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Bellota";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
