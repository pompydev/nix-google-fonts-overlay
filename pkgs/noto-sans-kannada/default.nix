{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-kannada-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanskannada/NotoSansKannada%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansKannada_wdth,wght_.ttf";
      sha256 = "6a5a725eb3e9071878b332338df7720633504ea9cc0d3a46f9d50197ec42a604";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansKannada_wdth,wght_.ttf $out/share/fonts/truetype/NotoSansKannada_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Kannada";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
