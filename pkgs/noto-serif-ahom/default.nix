{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-ahom-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notoserifahom/NotoSerifAhom-Regular.ttf?raw=true";
      name = "NotoSerifAhom-Regular.ttf";
      sha256 = "d6a2a355b4ef6f2228d58b61e2f650255d36488efe272a36e67aa16b663ffa03";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifAhom-Regular.ttf $out/share/fonts/truetype/NotoSerifAhom-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Ahom";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
