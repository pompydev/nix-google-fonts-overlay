{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-old-sogdian-${version}";
  version = "2022-05-24-075352";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansoldsogdian/NotoSansOldSogdian-Regular.ttf?raw=true";
      name = "NotoSansOldSogdian-Regular.ttf";
      sha256 = "0337534324975907588adbc8655e4ca622a0cbffc49384eb7410aa443a87afaa";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansOldSogdian-Regular.ttf $out/share/fonts/truetype/NotoSansOldSogdian-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Old Sogdian";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
