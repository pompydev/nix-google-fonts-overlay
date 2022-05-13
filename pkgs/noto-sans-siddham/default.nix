{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-siddham-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanssiddham/NotoSansSiddham-Regular.ttf?raw=true";
      name = "NotoSansSiddham-Regular.ttf";
      sha256 = "24eb19cc185685d185eb595766c79380160f76992d2023ae9b973e2f1ca4b763";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansSiddham-Regular.ttf $out/share/fonts/truetype/NotoSansSiddham-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Siddham";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
