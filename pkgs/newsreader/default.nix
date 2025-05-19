{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "newsreader-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/newsreader/Newsreader%5Bopsz,wght%5D.ttf?raw=true";
      name = "Newsreader_opsz,wght_.ttf";
      sha256 = "8a08d13f8a6c0d51be379a60af84f945f65369a67e509ee3c3bdcc421254d7c1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/newsreader/Newsreader-Italic%5Bopsz,wght%5D.ttf?raw=true";
      name = "Newsreader-Italic_opsz,wght_.ttf";
      sha256 = "796668611f80b64d5adf182fde3b6f29ed83b4e7cbec7b96937e84ac01364792";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Newsreader_opsz,wght_.ttf $out/share/fonts/truetype/Newsreader_opsz,wght_.ttf
     install -Dm644 Newsreader-Italic_opsz,wght_.ttf $out/share/fonts/truetype/Newsreader-Italic_opsz,wght_.ttf
  '';

  meta = with lib; {
    description = "Newsreader";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
