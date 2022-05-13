{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-deseret-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansdeseret/NotoSansDeseret-Regular.ttf?raw=true";
      name = "NotoSansDeseret-Regular.ttf";
      sha256 = "35a4d331a76073eeff539442b2c3b49efb58baa0d34d1da0f685f6a4b98d1e2f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansDeseret-Regular.ttf $out/share/fonts/truetype/NotoSansDeseret-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Deseret";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
