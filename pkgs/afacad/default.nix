{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "afacad-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/afacad/Afacad%5Bwght%5D.ttf?raw=true";
      name = "Afacad_wght_.ttf";
      sha256 = "89513fc375cafeecca81110f6a3ef5882d7ac2d871a365b6c93bbfa6039b8230";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/afacad/Afacad-Italic%5Bwght%5D.ttf?raw=true";
      name = "Afacad-Italic_wght_.ttf";
      sha256 = "1cf0a5853330267433c0a1603e239ff33e5963887ec2545c96a1516ca960a717";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Afacad_wght_.ttf $out/share/fonts/truetype/Afacad_wght_.ttf
     install -Dm644 Afacad-Italic_wght_.ttf $out/share/fonts/truetype/Afacad-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Afacad";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
