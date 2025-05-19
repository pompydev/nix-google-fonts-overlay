{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "albert-sans-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/albertsans/AlbertSans%5Bwght%5D.ttf?raw=true";
      name = "AlbertSans_wght_.ttf";
      sha256 = "8fe5d4cf5822d7096d4d17ad781c90f97c745ac13a22be619db74966fba45fda";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/albertsans/AlbertSans-Italic%5Bwght%5D.ttf?raw=true";
      name = "AlbertSans-Italic_wght_.ttf";
      sha256 = "16eb3291f7389045e90a00abb66a3d2bca1d03387b7ebbbc2b0cd9a094f86226";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AlbertSans_wght_.ttf $out/share/fonts/truetype/AlbertSans_wght_.ttf
     install -Dm644 AlbertSans-Italic_wght_.ttf $out/share/fonts/truetype/AlbertSans-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Albert Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
