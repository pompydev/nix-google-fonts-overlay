{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-grantha-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notoserifgrantha/NotoSerifGrantha-Regular.ttf?raw=true";
      name = "NotoSerifGrantha-Regular.ttf";
      sha256 = "469306809e14c3ab636ae07d5c2552252352a9e924ce53c90da84dc2f0c8cfb4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifGrantha-Regular.ttf $out/share/fonts/truetype/NotoSerifGrantha-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Grantha";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
