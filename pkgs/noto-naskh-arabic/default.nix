{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-naskh-arabic-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notonaskharabic/NotoNaskhArabic[wght].ttf?raw=true";
      name = "NotoNaskhArabic[wght].ttf";
      sha256 = "d9c87ec796cd6155d47a91b8270f93932a25618a102c8ec7c1441a80c2b25851";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'NotoNaskhArabic[wght].ttf' $out/share/fonts/truetype/'NotoNaskhArabic[wght].ttf'
  '';

  meta = with lib; {
    description = "Noto Naskh Arabic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
