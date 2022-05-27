{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "b612-mono-${version}";
  version = "2022-05-23-211740";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bff0396e9441e090a54ce93d7eb46aec79f721a3/ofl/b612mono/B612Mono-Regular.ttf?raw=true";
      name = "B612Mono-Regular.ttf";
      sha256 = "b98cb96cc8a6206dae08c063d60902df7e6d40f86139ebdb97256704253c9c69";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bff0396e9441e090a54ce93d7eb46aec79f721a3/ofl/b612mono/B612Mono-Italic.ttf?raw=true";
      name = "B612Mono-Italic.ttf";
      sha256 = "d58fa807e69d18159a40d5790d25772239df20167b50a0f840e9feb253002c9c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bff0396e9441e090a54ce93d7eb46aec79f721a3/ofl/b612mono/B612Mono-Bold.ttf?raw=true";
      name = "B612Mono-Bold.ttf";
      sha256 = "b467b1d19fdabed42be51d87e38c86645ceeff2f828f294775188d00d1fd68ca";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bff0396e9441e090a54ce93d7eb46aec79f721a3/ofl/b612mono/B612Mono-BoldItalic.ttf?raw=true";
      name = "B612Mono-BoldItalic.ttf";
      sha256 = "91a6a8535fc61354a2c59a64ea205a4f6957c2e09ac4ff91a1fc61d346c004e1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 B612Mono-Regular.ttf $out/share/fonts/truetype/B612Mono-Regular.ttf
     install -Dm644 B612Mono-Italic.ttf $out/share/fonts/truetype/B612Mono-Italic.ttf
     install -Dm644 B612Mono-Bold.ttf $out/share/fonts/truetype/B612Mono-Bold.ttf
     install -Dm644 B612Mono-BoldItalic.ttf $out/share/fonts/truetype/B612Mono-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "B612 Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
