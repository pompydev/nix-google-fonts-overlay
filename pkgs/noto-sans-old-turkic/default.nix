{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-old-turkic-${version}";
  version = "2022-05-24-075352";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansoldturkic/NotoSansOldTurkic-Regular.ttf?raw=true";
      name = "NotoSansOldTurkic-Regular.ttf";
      sha256 = "7da596306eb88cdab43bb44d45d0b5bb12614488be6e4eec31cc8413c3e18773";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansOldTurkic-Regular.ttf $out/share/fonts/truetype/NotoSansOldTurkic-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Old Turkic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
