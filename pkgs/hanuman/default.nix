{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hanuman-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/hanuman/Hanuman-Thin.ttf?raw=true";
      name = "Hanuman-Thin.ttf";
      sha256 = "5334c72bd57465da9e16528055540c20c67476ae2fa7472dd4504cea673fe2f7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/hanuman/Hanuman-Light.ttf?raw=true";
      name = "Hanuman-Light.ttf";
      sha256 = "670367ff1060838be63b789f08b253e236f80f533da79cccea9420b884c24adb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/hanuman/Hanuman-Regular.ttf?raw=true";
      name = "Hanuman-Regular.ttf";
      sha256 = "d982458e593018f1f10a754344419bf79d25d76adc9ffbaa8d609e6ff44e4906";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/hanuman/Hanuman-Bold.ttf?raw=true";
      name = "Hanuman-Bold.ttf";
      sha256 = "0570d63c1bc109170bfe1cc896015570eb89d91f486856c4dfdb0e5028a30264";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/hanuman/Hanuman-Black.ttf?raw=true";
      name = "Hanuman-Black.ttf";
      sha256 = "68f9db84ce0a78206dbc0717f6c8e434a7c9c2694ede430c302c67cd0a1e6bd1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Hanuman-Thin.ttf $out/share/fonts/truetype/Hanuman-Thin.ttf
     install -Dm644 Hanuman-Light.ttf $out/share/fonts/truetype/Hanuman-Light.ttf
     install -Dm644 Hanuman-Regular.ttf $out/share/fonts/truetype/Hanuman-Regular.ttf
     install -Dm644 Hanuman-Bold.ttf $out/share/fonts/truetype/Hanuman-Bold.ttf
     install -Dm644 Hanuman-Black.ttf $out/share/fonts/truetype/Hanuman-Black.ttf
  '';

  meta = with lib; {
    description = "Hanuman";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
