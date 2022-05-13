{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "public-sans-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f4c4f1fcbc0d4ec0a194848c1d9683157e3e783e/ofl/publicsans/PublicSans[wght].ttf?raw=true";
      name = "PublicSans[wght].ttf";
      sha256 = "ba4a92d3fe1a78822e242aff733f287dbcb90b7ba2e59aeaf192c633e087219b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f4c4f1fcbc0d4ec0a194848c1d9683157e3e783e/ofl/publicsans/PublicSans-Italic[wght].ttf?raw=true";
      name = "PublicSans-Italic[wght].ttf";
      sha256 = "9aa41974baa024f8b4a9479fd5cf9678a27a51c29c5d312048807ff4849aff36";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'PublicSans[wght].ttf' $out/share/fonts/truetype/'PublicSans[wght].ttf'
     install -Dm644 'PublicSans-Italic[wght].ttf' $out/share/fonts/truetype/'PublicSans-Italic[wght].ttf'
  '';

  meta = with lib; {
    description = "Public Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
