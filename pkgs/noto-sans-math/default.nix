{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-math-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansmath/NotoSansMath-Regular.ttf?raw=true";
      name = "NotoSansMath-Regular.ttf";
      sha256 = "8242bd1e55368b27e32455260754cf9aa58f3ad7ea80664b66c21f1b09910d6c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansMath-Regular.ttf $out/share/fonts/truetype/NotoSansMath-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Math";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
