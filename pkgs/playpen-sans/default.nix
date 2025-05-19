{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playpen-sans-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playpensans/PlaypenSans%5Bwght%5D.ttf?raw=true";
      name = "PlaypenSans_wght_.ttf";
      sha256 = "e083f9da8be210e08ea982ab510894641aab37590e70620d6db73f8de881ec4a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaypenSans_wght_.ttf $out/share/fonts/truetype/PlaypenSans_wght_.ttf
  '';

  meta = with lib; {
    description = "Playpen Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
