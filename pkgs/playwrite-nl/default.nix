{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-nl-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwritenl/PlaywriteNL%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteNL_wght_.ttf";
      sha256 = "e64eacdbb78c16aba09009a8946158472e1b0ec45a9e4a530e33f6f6bc252c5a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteNL_wght_.ttf $out/share/fonts/truetype/PlaywriteNL_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite NL";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
