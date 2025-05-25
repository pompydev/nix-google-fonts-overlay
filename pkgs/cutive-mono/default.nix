{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cutive-mono-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/cutivemono/CutiveMono-Regular.ttf?raw=true";
      name = "CutiveMono-Regular.ttf";
      sha256 = "96a36a00079058684982f61ee334323f8b501d7b68dcecd6049a4f9177e3a62c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CutiveMono-Regular.ttf $out/share/fonts/truetype/CutiveMono-Regular.ttf
  '';

  meta = with lib; {
    description = "Cutive Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
