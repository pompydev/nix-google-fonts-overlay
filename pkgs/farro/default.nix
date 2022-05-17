{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "farro-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/57a48fbbb5add143366aac7503dceb2d2d32be00/ofl/farro/Farro-Light.ttf?raw=true";
      name = "Farro-Light.ttf";
      sha256 = "0e66c58243c6f4f7b10ea268b52687c627d658d607493865aee474acf2b5d7fb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/57a48fbbb5add143366aac7503dceb2d2d32be00/ofl/farro/Farro-Regular.ttf?raw=true";
      name = "Farro-Regular.ttf";
      sha256 = "eed5807e2779c1fba1a1627a1d34b0450e4fc6a87200522e2f3e3f617221c82b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/57a48fbbb5add143366aac7503dceb2d2d32be00/ofl/farro/Farro-Medium.ttf?raw=true";
      name = "Farro-Medium.ttf";
      sha256 = "a5447bf5122e9a9804007c56353653ee7f223008120d428a5176a028ec697c80";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/57a48fbbb5add143366aac7503dceb2d2d32be00/ofl/farro/Farro-Bold.ttf?raw=true";
      name = "Farro-Bold.ttf";
      sha256 = "7671a5d122d2e303c7ecdbeb0e3ce552ec8ab644484d587e72ac71a06d3d9a07";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Farro-Light.ttf $out/share/fonts/truetype/Farro-Light.ttf
     install -Dm644 Farro-Regular.ttf $out/share/fonts/truetype/Farro-Regular.ttf
     install -Dm644 Farro-Medium.ttf $out/share/fonts/truetype/Farro-Medium.ttf
     install -Dm644 Farro-Bold.ttf $out/share/fonts/truetype/Farro-Bold.ttf
  '';

  meta = with lib; {
    description = "Farro";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
