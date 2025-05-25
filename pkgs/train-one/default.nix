{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "train-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/trainone/TrainOne-Regular.ttf?raw=true";
      name = "TrainOne-Regular.ttf";
      sha256 = "07d67ad14231a4a41f0ee501b14bd6f9c7a9beada5ee6af2924114863a034623";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 TrainOne-Regular.ttf $out/share/fonts/truetype/TrainOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Train One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
