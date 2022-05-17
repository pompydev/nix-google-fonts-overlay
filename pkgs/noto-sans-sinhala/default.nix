{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-sinhala-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanssinhala/NotoSansSinhala%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansSinhala_wdth,wght_.ttf";
      sha256 = "b7272d5a0e48ec1f8e1c27fe6f28feb3d2288c043c4c940c5fca64c34b206a4c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansSinhala_wdth,wght_.ttf $out/share/fonts/truetype/NotoSansSinhala_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Sinhala";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
