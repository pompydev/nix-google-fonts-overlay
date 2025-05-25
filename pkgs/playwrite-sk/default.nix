{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-sk-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwritesk/PlaywriteSK%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteSK_wght_.ttf";
      sha256 = "781c0d8ae19485460f0f28747819900c780cba07a4e11f3a929fe40aa156a3c1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteSK_wght_.ttf $out/share/fonts/truetype/PlaywriteSK_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite SK";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
