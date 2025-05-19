{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "zen-loop-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/zenloop/ZenLoop-Regular.ttf?raw=true";
      name = "ZenLoop-Regular.ttf";
      sha256 = "06c4de349ee28ef965f9a5361ef2c28841628adcc3e86490b9811584acb2378b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/zenloop/ZenLoop-Italic.ttf?raw=true";
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
