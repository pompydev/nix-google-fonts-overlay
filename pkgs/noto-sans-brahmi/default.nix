{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-brahmi-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansbrahmi/NotoSansBrahmi-Regular.ttf?raw=true";
      name = "NotoSansBrahmi-Regular.ttf";
      sha256 = "0c9e9d7ebc20b81fff7cf5bcfc4ed5552ad97b3a583c6e33baa2d38952182d05";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansBrahmi-Regular.ttf $out/share/fonts/truetype/NotoSansBrahmi-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Brahmi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
