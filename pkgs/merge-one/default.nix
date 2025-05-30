{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "merge-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/mergeone/MergeOne-Regular.ttf?raw=true";
      name = "MergeOne-Regular.ttf";
      sha256 = "93ad28579d4abf3bec9ad9961fd20912ecea60afad1d77c3ecbd39349b88d967";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MergeOne-Regular.ttf $out/share/fonts/truetype/MergeOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Merge One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
