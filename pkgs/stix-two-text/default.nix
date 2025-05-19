{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "stix-two-text-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/stixtwotext/STIXTwoText%5Bwght%5D.ttf?raw=true";
      name = "STIXTwoText_wght_.ttf";
      sha256 = "7962b8b7811e6a896c9a91a0bccbb5241047770eb24d4997c5cb5fe21d5c0df2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/stixtwotext/STIXTwoText-Italic%5Bwght%5D.ttf?raw=true";
      name = "STIXTwoText-Italic_wght_.ttf";
      sha256 = "88c0e2e316eaff56eddc9e51e4850317e2a1e490bbf758b2dec4793aedba9c74";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 STIXTwoText_wght_.ttf $out/share/fonts/truetype/STIXTwoText_wght_.ttf
     install -Dm644 STIXTwoText-Italic_wght_.ttf $out/share/fonts/truetype/STIXTwoText-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "STIX Two Text";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
