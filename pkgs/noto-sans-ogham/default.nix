{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-ogham-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansogham/NotoSansOgham-Regular.ttf?raw=true";
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
