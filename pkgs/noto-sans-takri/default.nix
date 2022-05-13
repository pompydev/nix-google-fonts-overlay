{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-takri-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanstakri/NotoSansTakri-Regular.ttf?raw=true";
      name = "NotoSansTakri-Regular.ttf";
      sha256 = "08f770fcc0bc890a7738ebc03f8f5e51d207e27a87ded0c567cba76343c51f5c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansTakri-Regular.ttf $out/share/fonts/truetype/NotoSansTakri-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Takri";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
