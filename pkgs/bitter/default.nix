{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bitter-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bitter/Bitter%5Bwght%5D.ttf?raw=true";
      name = "Bitter_wght_.ttf";
      sha256 = "ef2b9a711fb02f1e5823b34da1b7450e0fc76793b7d733a8b41006e24916d4a7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bitter/Bitter-Italic%5Bwght%5D.ttf?raw=true";
      name = "Bitter-Italic_wght_.ttf";
      sha256 = "5e6e0af503171c9d7b4be7a22c16f474d7a638cf83a80051d825bcc58d664bc3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Bitter_wght_.ttf $out/share/fonts/truetype/Bitter_wght_.ttf
     install -Dm644 Bitter-Italic_wght_.ttf $out/share/fonts/truetype/Bitter-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Bitter";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
