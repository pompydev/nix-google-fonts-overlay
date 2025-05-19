{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "reddit-sans-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/redditsans/RedditSans%5Bwght%5D.ttf?raw=true";
      name = "RedditSans_wght_.ttf";
      sha256 = "9a564474e5df96608ac1908c555a5f01f52a28d960b94d34c85a48153b0ac557";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/redditsans/RedditSans-Italic%5Bwght%5D.ttf?raw=true";
      name = "RedditSans-Italic_wght_.ttf";
      sha256 = "c68ff1930f5b4046181fc6927c6c35ef5352972173c51cc5ef7376a1e949cd07";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RedditSans_wght_.ttf $out/share/fonts/truetype/RedditSans_wght_.ttf
     install -Dm644 RedditSans-Italic_wght_.ttf $out/share/fonts/truetype/RedditSans-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Reddit Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
