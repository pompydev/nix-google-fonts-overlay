{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-ogham-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansogham/NotoSansOgham-Regular.ttf?raw=true";
      name = "NotoSansOgham-Regular.ttf";
      sha256 = "6a70572d381f3a54fdaa3b373b865f4d97377c65434493b294b1dfacc7c4f58c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansOgham-Regular.ttf $out/share/fonts/truetype/NotoSansOgham-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Ogham";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
