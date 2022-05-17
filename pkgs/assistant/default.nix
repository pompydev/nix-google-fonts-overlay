{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "assistant-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89c9db01508963eb8b48a171c8baf2ef750c5bd9/ofl/assistant/Assistant%5Bwght%5D.ttf?raw=true";
      name = "Assistant_wght_.ttf";
      sha256 = "1c3b393884f8fb133a1b17f41d26178adae1050a4f86d7a429d1b5658c314fa3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Assistant_wght_.ttf $out/share/fonts/truetype/Assistant_wght_.ttf
  '';

  meta = with lib; {
    description = "Assistant";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
