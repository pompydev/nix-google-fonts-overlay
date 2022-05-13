{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-syloti-nagri-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanssylotinagri/NotoSansSylotiNagri-Regular.ttf?raw=true";
      name = "NotoSansSylotiNagri-Regular.ttf";
      sha256 = "4ff931e443e1356a1207c12c4e18fff62442bd1d3a653430ac56a4aa0a70021b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansSylotiNagri-Regular.ttf $out/share/fonts/truetype/NotoSansSylotiNagri-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Syloti Nagri";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
