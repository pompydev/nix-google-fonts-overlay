{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "dm-sans-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/dmsans/DMSans%5Bopsz,wght%5D.ttf?raw=true";
      name = "DMSans_opsz,wght_.ttf";
      sha256 = "8cd08d97e89c24d0aa92edd2f0f4c8ee6195eee9b7c9f154865a58b02f0c1c0d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/dmsans/DMSans-Italic%5Bopsz,wght%5D.ttf?raw=true";
      name = "DMSans-Italic_opsz,wght_.ttf";
      sha256 = "22259c0cc8237221b80f44c76ba8d36e6bce3cda72779f5b2773643d499720ae";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DMSans_opsz-wght_.ttf $out/share/fonts/truetype/DMSans_opsz-wght_.ttf
     install -Dm644 DMSans-Italic_opsz-wght_.ttf $out/share/fonts/truetype/DMSans-Italic_opsz-wght_.ttf
  '';

  meta = with lib; {
    description = "DM Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
