{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-mandaic-${version}";
  version = "2022-05-24-065742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansmandaic/NotoSansMandaic-Regular.ttf?raw=true";
      name = "NotoSansMandaic-Regular.ttf";
      sha256 = "a50d69dc52998618f39e490423ab5943d6456f50ade486b54c339e06d53a2c3a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansMandaic-Regular.ttf $out/share/fonts/truetype/NotoSansMandaic-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Mandaic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
