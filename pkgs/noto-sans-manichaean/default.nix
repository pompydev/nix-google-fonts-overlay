{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-manichaean-${version}";
  version = "2022-05-24-065742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansmanichaean/NotoSansManichaean-Regular.ttf?raw=true";
      name = "NotoSansManichaean-Regular.ttf";
      sha256 = "50fd97d20306431271e23523a8d3e57210d105add3c340efd2ee5f77b63ac756";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansManichaean-Regular.ttf $out/share/fonts/truetype/NotoSansManichaean-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Manichaean";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
