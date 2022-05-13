{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-old-hungarian-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansoldhungarian/NotoSansOldHungarian-Regular.ttf?raw=true";
      name = "NotoSansOldHungarian-Regular.ttf";
      sha256 = "fd726b1df5a03c790c93b2be4e397f50319b1e04e6ae8a671386446e3c8e9888";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansOldHungarian-Regular.ttf $out/share/fonts/truetype/NotoSansOldHungarian-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Old Hungarian";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
