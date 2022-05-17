{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "reem-kufi-fun-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/35a8cf3bf9ae2f862abf63d18fdeadb70694fad1/ofl/reemkufifun/ReemKufiFun[wght].ttf?raw=true";
      name = "ReemKufiFun_wght_.ttf";
      sha256 = "4cc6c2ef6fc89ad3b1e507a7fc5ce9559b64b3ff3a10aca45768a67a24a7279f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ReemKufiFun_wght_.ttf $out/share/fonts/truetype/ReemKufiFun_wght_.ttf
  '';

  meta = with lib; {
    description = "Reem Kufi Fun";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
