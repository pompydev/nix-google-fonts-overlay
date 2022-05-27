{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-carian-${version}";
  version = "2022-05-24-065742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanscarian/NotoSansCarian-Regular.ttf?raw=true";
      name = "NotoSansCarian-Regular.ttf";
      sha256 = "962bac788f4ab38c61f6de86d5b8c1bca2b105d88a511c10b9a9058c6b1291aa";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansCarian-Regular.ttf $out/share/fonts/truetype/NotoSansCarian-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Carian";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
