{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-hk-${version}";
  version = "2022-05-12-102739";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d8073b365941159b40129acdc7422be43f9b4afb/ofl/notosanshk/NotoSansHK[wght].ttf?raw=true";
      name = "NotoSansHK_wght_.ttf";
      sha256 = "6e329b1850a358932c0bce9188f084aeff57e95f14d6aadfeb36a7cd1e317be6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansHK_wght_.ttf $out/share/fonts/truetype/NotoSansHK_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans HK";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
