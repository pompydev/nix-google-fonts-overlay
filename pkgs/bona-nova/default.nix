{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bona-nova-${version}";
  version = "2022-05-23-211740";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/728f6da025e3c73cab9192712492c01ad5922919/ofl/bonanova/BonaNova-Regular.ttf?raw=true";
      name = "BonaNova-Regular.ttf";
      sha256 = "d72f7715b6b66096e0cc2971e4954f8be33bdced1f143f9c5739a03cdb60bede";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/728f6da025e3c73cab9192712492c01ad5922919/ofl/bonanova/BonaNova-Italic.ttf?raw=true";
      name = "BonaNova-Italic.ttf";
      sha256 = "0d61c160a521b072d1af19e9683754f3f5761bbce35f73fdf091ecdf495bc6c2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/728f6da025e3c73cab9192712492c01ad5922919/ofl/bonanova/BonaNova-Bold.ttf?raw=true";
      name = "BonaNova-Bold.ttf";
      sha256 = "c59ccb3ba8f0151236b1b427b58bee0c90607c82ef747cc6e19d5e20138385dd";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BonaNova-Regular.ttf $out/share/fonts/truetype/BonaNova-Regular.ttf
     install -Dm644 BonaNova-Italic.ttf $out/share/fonts/truetype/BonaNova-Italic.ttf
     install -Dm644 BonaNova-Bold.ttf $out/share/fonts/truetype/BonaNova-Bold.ttf
  '';

  meta = with lib; {
    description = "Bona Nova";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
