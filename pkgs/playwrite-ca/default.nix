{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-ca-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwriteca/PlaywriteCA%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteCA_wght_.ttf";
      sha256 = "b44180f755690cf8e0e115d2cf32714dff6c94744d67724f125d2267a0ef60cc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteCA_wght_.ttf $out/share/fonts/truetype/PlaywriteCA_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite CA";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
