{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "life-savers-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/177d8ea721d408efc0bc64ae7bedd1193e0ed0d1/ofl/lifesavers/LifeSavers-Regular.ttf?raw=true";
      name = "LifeSavers-Regular.ttf";
      sha256 = "4e4bfebdf05737dd20d82c265ddf128b7dbd962bd53941075a6aa56cde30e8c3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/177d8ea721d408efc0bc64ae7bedd1193e0ed0d1/ofl/lifesavers/LifeSavers-Bold.ttf?raw=true";
      name = "LifeSavers-Bold.ttf";
      sha256 = "9d5534f9ad41a14794be42768bae114fdd3ef64feaba65008a17bf22821d1b01";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/177d8ea721d408efc0bc64ae7bedd1193e0ed0d1/ofl/lifesavers/LifeSavers-ExtraBold.ttf?raw=true";
      name = "LifeSavers-ExtraBold.ttf";
      sha256 = "c5d0ba88ca91171573bc0ea3eead229da892c827be8b62738f9c975c0dc18b52";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LifeSavers-Regular.ttf $out/share/fonts/truetype/LifeSavers-Regular.ttf
     install -Dm644 LifeSavers-Bold.ttf $out/share/fonts/truetype/LifeSavers-Bold.ttf
     install -Dm644 LifeSavers-ExtraBold.ttf $out/share/fonts/truetype/LifeSavers-ExtraBold.ttf
  '';

  meta = with lib; {
    description = "Life Savers";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
