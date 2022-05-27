{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-buginese-${version}";
  version = "2022-05-24-065742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansbuginese/NotoSansBuginese-Regular.ttf?raw=true";
      name = "NotoSansBuginese-Regular.ttf";
      sha256 = "9572118c512044497fa06cf5ae5209a245295a21746dac2f34ec5fad094f66c0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansBuginese-Regular.ttf $out/share/fonts/truetype/NotoSansBuginese-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Buginese";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
