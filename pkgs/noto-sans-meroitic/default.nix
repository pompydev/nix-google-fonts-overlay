{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-meroitic-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansmeroitic/NotoSansMeroitic-Regular.ttf?raw=true";
      name = "NotoSansMeroitic-Regular.ttf";
      sha256 = "49c76f5da44b932249c6150f41d20e8f4a405e28d8823a6fd724b05bc1029375";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansMeroitic-Regular.ttf $out/share/fonts/truetype/NotoSansMeroitic-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Meroitic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
