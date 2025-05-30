{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-lycian-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanslycian/NotoSansLycian-Regular.ttf?raw=true";
      name = "NotoSansLycian-Regular.ttf";
      sha256 = "81ad6994c822aba066219b06e6e097dcedba449b33c6fe6ceb79c2cdeb88664f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansLycian-Regular.ttf $out/share/fonts/truetype/NotoSansLycian-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Lycian";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
