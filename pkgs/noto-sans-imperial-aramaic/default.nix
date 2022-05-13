{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-imperial-aramaic-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansimperialaramaic/NotoSansImperialAramaic-Regular.ttf?raw=true";
      name = "NotoSansImperialAramaic-Regular.ttf";
      sha256 = "a1eaa5484ea50bace57ed59ea64e630abf196d7eaf55e26b0ed299223a5100c3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansImperialAramaic-Regular.ttf $out/share/fonts/truetype/NotoSansImperialAramaic-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Imperial Aramaic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
