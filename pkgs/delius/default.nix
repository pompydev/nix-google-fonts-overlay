{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "delius-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/delius/Delius-Regular.ttf?raw=true";
      name = "Delius-Regular.ttf";
      sha256 = "c0fd66626926b637d64eb13de013b3318dbd72cdf92c33e41a29a03828bab6f6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Delius-Regular.ttf $out/share/fonts/truetype/Delius-Regular.ttf
  '';

  meta = with lib; {
    description = "Delius";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
