{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-tc-${version}";
  version = "2022-06-08-123023";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/68c94e3347838d4cf740e7c4da57b224849dc340/ofl/notoseriftc/NotoSerifTC%5Bwght%5D.ttf?raw=true";
      name = "NotoSerifTC_wght_.ttf";
      sha256 = "1b6090ee7d5a55b444281ba45a099d08a4bdc82f4812866ed734b169bc48e89a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifTC_wght_.ttf $out/share/fonts/truetype/NotoSerifTC_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif TC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
