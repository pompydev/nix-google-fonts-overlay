{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mulish-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/mulish/Mulish%5Bwght%5D.ttf?raw=true";
      name = "Mulish_wght_.ttf";
      sha256 = "00f1105796291a2fdda117a0fc7f25d8e68f8010cdbb34a411f60b3bd57717ac";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/mulish/Mulish-Italic%5Bwght%5D.ttf?raw=true";
      name = "Mulish-Italic_wght_.ttf";
      sha256 = "4f4d5f97b530500232d9d487101b8283840168dcfe7b8b9a285af65f0fa8aaab";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Mulish_wght_.ttf $out/share/fonts/truetype/Mulish_wght_.ttf
     install -Dm644 Mulish-Italic_wght_.ttf $out/share/fonts/truetype/Mulish-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Mulish";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
