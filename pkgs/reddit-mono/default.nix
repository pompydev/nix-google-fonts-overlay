{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "reddit-mono-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/redditmono/RedditMono%5Bwght%5D.ttf?raw=true";
      name = "RedditMono_wght_.ttf";
      sha256 = "5b092e066eb178a4450a5cb53469015468ec33e19716a4cbf9257eaf1e5a10c2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RedditMono_wght_.ttf $out/share/fonts/truetype/RedditMono_wght_.ttf
  '';

  meta = with lib; {
    description = "Reddit Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
