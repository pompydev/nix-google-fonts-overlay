{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mona-sans-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/monasans/MonaSans%5Bwdth,wght%5D.ttf?raw=true";
      name = "MonaSans_wdth,wght_.ttf";
      sha256 = "fd6e79634b5ae804a45aac7e2e3c2a325b41291fba59034f4732b0135b8475b3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/monasans/MonaSans-Italic%5Bwdth,wght%5D.ttf?raw=true";
      name = "MonaSans-Italic_wdth,wght_.ttf";
      sha256 = "31e7df54477a3cd46677356ada1d2806bcb4c0dbe3b32987783a74a139d8d064";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MonaSans_wdth,wght_.ttf $out/share/fonts/truetype/MonaSans_wdth,wght_.ttf
     install -Dm644 MonaSans-Italic_wdth,wght_.ttf $out/share/fonts/truetype/MonaSans-Italic_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Mona Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
