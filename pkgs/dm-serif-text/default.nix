{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "dm-serif-text-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/dmseriftext/DMSerifText-Regular.ttf?raw=true";
      name = "DMSerifText-Regular.ttf";
      sha256 = "94b5fa7bac0f406cb3149512037f37ea21b55cecd732c3fd3a076260441399cd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/dmseriftext/DMSerifText-Italic.ttf?raw=true";
      name = "DMSerifText-Italic.ttf";
      sha256 = "d016b81df5cd7462188a0ba11dc343ce2897dffa39fb1fcff0fef0bb7684364e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DMSerifText-Regular.ttf $out/share/fonts/truetype/DMSerifText-Regular.ttf
     install -Dm644 DMSerifText-Italic.ttf $out/share/fonts/truetype/DMSerifText-Italic.ttf
  '';

  meta = with lib; {
    description = "DM Serif Text";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
