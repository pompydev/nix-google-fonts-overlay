{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-chakma-${version}";
  version = "2022-05-24-065742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanschakma/NotoSansChakma-Regular.ttf?raw=true";
      name = "NotoSansChakma-Regular.ttf";
      sha256 = "281bbdb5c31aae460c3a58acd0ba9ed5f92e58ebb03f7614be7c4441520c5525";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansChakma-Regular.ttf $out/share/fonts/truetype/NotoSansChakma-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Chakma";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
