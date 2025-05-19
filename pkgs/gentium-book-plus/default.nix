{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gentium-book-plus-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/gentiumbookplus/GentiumBookPlus-Regular.ttf?raw=true";
      name = "GentiumBookPlus-Regular.ttf";
      sha256 = "fe7b64eeacc430fcf46836a6f0dfe00d2c5a15483ed36692a2a185cb23ec2a5c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/gentiumbookplus/GentiumBookPlus-Italic.ttf?raw=true";
      name = "GentiumBookPlus-Italic.ttf";
      sha256 = "7a0ab4bd78701fa46d325e362654c41a47e2a0a5cb4a3eebc94dce89c2ee7df1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/gentiumbookplus/GentiumBookPlus-Bold.ttf?raw=true";
      name = "GentiumBookPlus-Bold.ttf";
      sha256 = "b39c3fb12e2e15e2336f2ec6d051c778618ec25f7360bc4765bfe755b408c011";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/gentiumbookplus/GentiumBookPlus-BoldItalic.ttf?raw=true";
      name = "GentiumBookPlus-BoldItalic.ttf";
      sha256 = "e557dd7a7f818fa482c3e63c7576c6d455f6f2e3bf9d84e0a11d1617e2bc1383";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GentiumBookPlus-Regular.ttf $out/share/fonts/truetype/GentiumBookPlus-Regular.ttf
     install -Dm644 GentiumBookPlus-Italic.ttf $out/share/fonts/truetype/GentiumBookPlus-Italic.ttf
     install -Dm644 GentiumBookPlus-Bold.ttf $out/share/fonts/truetype/GentiumBookPlus-Bold.ttf
     install -Dm644 GentiumBookPlus-BoldItalic.ttf $out/share/fonts/truetype/GentiumBookPlus-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Gentium Book Plus";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
