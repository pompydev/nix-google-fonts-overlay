{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "texturina-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/texturina/Texturina%5Bopsz,wght%5D.ttf?raw=true";
      name = "Texturina_opsz,wght_.ttf";
      sha256 = "478a15d7145cf94565cfc1aeb33596aeb0118c7d86a84d061ddf46de3d7dfda3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/texturina/Texturina-Italic%5Bopsz,wght%5D.ttf?raw=true";
      name = "Texturina-Italic_opsz,wght_.ttf";
      sha256 = "d5827e6531510e9b5e2a95f3042ee7463b0b1f320f9a4146159a553482f6e339";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Texturina_opsz,wght_.ttf $out/share/fonts/truetype/Texturina_opsz,wght_.ttf
     install -Dm644 Texturina-Italic_opsz,wght_.ttf $out/share/fonts/truetype/Texturina-Italic_opsz,wght_.ttf
  '';

  meta = with lib; {
    description = "Texturina";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
