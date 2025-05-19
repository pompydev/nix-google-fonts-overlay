{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "m-plus-1p-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/mplus1p/MPLUS1p-Thin.ttf?raw=true";
      name = "MPLUS1p-Thin.ttf";
      sha256 = "aa093fe44beb740d2730e0437bdd0bfeb57b526d30e8b2410e29ec6503434dd6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/mplus1p/MPLUS1p-Light.ttf?raw=true";
      name = "MPLUS1p-Light.ttf";
      sha256 = "e39fa39f8556c3fdf47e01f68915d8d17936107f33fbead6b1b40fcf605c118c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/mplus1p/MPLUS1p-Regular.ttf?raw=true";
      name = "MPLUS1p-Regular.ttf";
      sha256 = "2f294ad496432b1608f070d310e3aa2adcf1de4af429f4901df97ec4bd361ed1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/mplus1p/MPLUS1p-Medium.ttf?raw=true";
      name = "MPLUS1p-Medium.ttf";
      sha256 = "28b2f52a40ae988064810b71d67e127df75a16e08d7df4e192d1006e4075394f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/mplus1p/MPLUS1p-Bold.ttf?raw=true";
      name = "MPLUS1p-Bold.ttf";
      sha256 = "76eb077b0a31ca33ca40238e47da5a17e2786741607cec09678d7d2e5ab1afc1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/mplus1p/MPLUS1p-ExtraBold.ttf?raw=true";
      name = "MPLUS1p-ExtraBold.ttf";
      sha256 = "d17f745712668b0dcd95e42b3634a90a76195228d4abf88a0be8e98ddbc441b2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/mplus1p/MPLUS1p-Black.ttf?raw=true";
      name = "MPLUS1p-Black.ttf";
      sha256 = "815821a62ce085e453af318ca004768e336329d5a7d6f7bed272e97e7862d43e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MPLUS1p-Thin.ttf $out/share/fonts/truetype/MPLUS1p-Thin.ttf
     install -Dm644 MPLUS1p-Light.ttf $out/share/fonts/truetype/MPLUS1p-Light.ttf
     install -Dm644 MPLUS1p-Regular.ttf $out/share/fonts/truetype/MPLUS1p-Regular.ttf
     install -Dm644 MPLUS1p-Medium.ttf $out/share/fonts/truetype/MPLUS1p-Medium.ttf
     install -Dm644 MPLUS1p-Bold.ttf $out/share/fonts/truetype/MPLUS1p-Bold.ttf
     install -Dm644 MPLUS1p-ExtraBold.ttf $out/share/fonts/truetype/MPLUS1p-ExtraBold.ttf
     install -Dm644 MPLUS1p-Black.ttf $out/share/fonts/truetype/MPLUS1p-Black.ttf
  '';

  meta = with lib; {
    description = "M PLUS 1p";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
