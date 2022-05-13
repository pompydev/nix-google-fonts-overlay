{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "aref-ruqaa-ink-${version}";
  version = "2022-05-11-150105";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8fd77aa0bcb63e4b0264af4fae896821fb919178/ofl/arefruqaaink/ArefRuqaaInk-Regular.ttf?raw=true";
      name = "ArefRuqaaInk-Regular.ttf";
      sha256 = "404d4e3c01db61833d43f58afdeacddd5e190a31ec858f5cfc06cd2112fc49d1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8fd77aa0bcb63e4b0264af4fae896821fb919178/ofl/arefruqaaink/ArefRuqaaInk-Bold.ttf?raw=true";
      name = "ArefRuqaaInk-Bold.ttf";
      sha256 = "a01d7fb8f8c0fd37952acea490eca72c4b6daabdb5ba50974c72edb2a2079d69";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ArefRuqaaInk-Regular.ttf $out/share/fonts/truetype/ArefRuqaaInk-Regular.ttf
     install -Dm644 ArefRuqaaInk-Bold.ttf $out/share/fonts/truetype/ArefRuqaaInk-Bold.ttf
  '';

  meta = with lib; {
    description = "Aref Ruqaa Ink";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
