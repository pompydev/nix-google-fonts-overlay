{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ibm-plex-sans-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ibmplexsans/IBMPlexSans%5Bwdth,wght%5D.ttf?raw=true";
      name = "IBMPlexSans_wdth,wght_.ttf";
      sha256 = "3b031aa4216174205bd8471f88a49b91f093169e9e87bd5262242bc5967fe2e3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ibmplexsans/IBMPlexSans-Italic%5Bwdth,wght%5D.ttf?raw=true";
      name = "IBMPlexSans-Italic_wdth,wght_.ttf";
      sha256 = "0b94c5e981993764db32bf9c610ecc60cbd34ad77ec2f10ba03c64ab75124d8e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 IBMPlexSans_wdth,wght_.ttf $out/share/fonts/truetype/IBMPlexSans_wdth,wght_.ttf
     install -Dm644 IBMPlexSans-Italic_wdth,wght_.ttf $out/share/fonts/truetype/IBMPlexSans-Italic_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "IBM Plex Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
