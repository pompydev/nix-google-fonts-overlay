{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-mro-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansmro/NotoSansMro-Regular.ttf?raw=true";
      name = "NotoSansMro-Regular.ttf";
      sha256 = "6e054fa6b6a160e4ddd41fc9be84d6d62851b75e1e2872dcdfe5fd003958b33f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansMro-Regular.ttf $out/share/fonts/truetype/NotoSansMro-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Mro";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
