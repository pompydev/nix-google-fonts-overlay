{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-buginese-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansbuginese/NotoSansBuginese-Regular.ttf?raw=true";
      name = "NotoSansBuginese-Regular.ttf";
      sha256 = "af1ed02af9eff48e872c3fcf922ba72053b776c2f0d1a0d4cb36e57d5e3508b5";
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
