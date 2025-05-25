{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-gb-s-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwritegbs/PlaywriteGBS%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteGBS_wght_.ttf";
      sha256 = "563b1d961356f9116b550935f27b0cb55466ffba3b9176066a5d9d9ceda6753b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwritegbs/PlaywriteGBS-Italic%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteGBS-Italic_wght_.ttf";
      sha256 = "9529eb87819fdf803a5d7e3e9c9d1d49ce85cf4f33a7ce1072acc3b4d55886b6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteGBS_wght_.ttf $out/share/fonts/truetype/PlaywriteGBS_wght_.ttf
     install -Dm644 PlaywriteGBS-Italic_wght_.ttf $out/share/fonts/truetype/PlaywriteGBS-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite GB S";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
