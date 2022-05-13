{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "dm-serif-text-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4c67e41131e3b8d3d761a9e9516370ea4f9cd3d2/ofl/dmseriftext/DMSerifText-Regular.ttf?raw=true";
      name = "DMSerifText-Regular.ttf";
      sha256 = "94b5fa7bac0f406cb3149512037f37ea21b55cecd732c3fd3a076260441399cd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4c67e41131e3b8d3d761a9e9516370ea4f9cd3d2/ofl/dmseriftext/DMSerifText-Italic.ttf?raw=true";
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
