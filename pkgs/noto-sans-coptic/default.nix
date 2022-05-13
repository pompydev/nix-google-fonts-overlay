{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-coptic-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanscoptic/NotoSansCoptic-Regular.ttf?raw=true";
      name = "NotoSansCoptic-Regular.ttf";
      sha256 = "9681bb92c70f4ff74a6a004a139719b6778dfabfcad17cec978a9601d9c69d29";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansCoptic-Regular.ttf $out/share/fonts/truetype/NotoSansCoptic-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Coptic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
