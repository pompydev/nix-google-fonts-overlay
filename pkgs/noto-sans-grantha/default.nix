{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-grantha-${version}";
  version = "2022-05-24-065742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansgrantha/NotoSansGrantha-Regular.ttf?raw=true";
      name = "NotoSansGrantha-Regular.ttf";
      sha256 = "493f987e5e8c86d3f4464fab2fb5b4f435e1d4e847a46b1922c311a3a7c441bc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansGrantha-Regular.ttf $out/share/fonts/truetype/NotoSansGrantha-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Grantha";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
