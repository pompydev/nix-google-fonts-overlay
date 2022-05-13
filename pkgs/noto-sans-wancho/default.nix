{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-wancho-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanswancho/NotoSansWancho-Regular.ttf?raw=true";
      name = "NotoSansWancho-Regular.ttf";
      sha256 = "e9840bd886a6133e000474eed786f0985a3cf68d45fa240d38a2a306c6a9965c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansWancho-Regular.ttf $out/share/fonts/truetype/NotoSansWancho-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Wancho";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
