{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-sundanese-${version}";
  version = "2022-05-24-075352";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanssundanese/NotoSansSundanese%5Bwght%5D.ttf?raw=true";
      name = "NotoSansSundanese_wght_.ttf";
      sha256 = "5a909fa1eec7a4e25b1238407c7759ee6e1e7e40cbef1a65fb6b9943f73ea50a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansSundanese_wght_.ttf $out/share/fonts/truetype/NotoSansSundanese_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Sundanese";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
