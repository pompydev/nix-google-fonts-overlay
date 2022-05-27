{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-ethiopic-${version}";
  version = "2022-05-24-065742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansethiopic/NotoSansEthiopic%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansEthiopic_wdth,wght_.ttf";
      sha256 = "e42df16d47e2fd7c08b7c860c38a5a7c4b1aae62f8035d1bd8ad4f848a39181f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansEthiopic_wdth,wght_.ttf $out/share/fonts/truetype/NotoSansEthiopic_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Ethiopic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
