{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "zen-loop-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f67bea885ba0ad06c6de7e41a8ec1f460f7820c6/ofl/zenloop/ZenLoop-Regular.ttf?raw=true";
      name = "ZenLoop-Regular.ttf";
      sha256 = "06c4de349ee28ef965f9a5361ef2c28841628adcc3e86490b9811584acb2378b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f67bea885ba0ad06c6de7e41a8ec1f460f7820c6/ofl/zenloop/ZenLoop-Italic.ttf?raw=true";
      name = "ZenLoop-Italic.ttf";
      sha256 = "7ae5141733792d8596d9be4b9ab865ccbfda30bcade02c935b5a918875bc46d8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ZenLoop-Regular.ttf $out/share/fonts/truetype/ZenLoop-Regular.ttf
     install -Dm644 ZenLoop-Italic.ttf $out/share/fonts/truetype/ZenLoop-Italic.ttf
  '';

  meta = with lib; {
    description = "Zen Loop";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
