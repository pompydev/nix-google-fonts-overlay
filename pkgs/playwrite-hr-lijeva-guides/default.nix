{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-hr-lijeva-guides-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritehrlijevaguides/PlaywriteHRLijevaGuides-Regular.ttf?raw=true";
      name = "PlaywriteHRLijevaGuides-Regular.ttf";
      sha256 = "59d4f7e83fd6b719d0057cc23a07a7bcd19689692af08a6a96bf93755a54fd13";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteHRLijevaGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteHRLijevaGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite HR Lijeva Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
