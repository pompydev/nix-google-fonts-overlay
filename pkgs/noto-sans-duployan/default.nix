{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-duployan-${version}";
  version = "2022-05-24-065742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansduployan/NotoSansDuployan-Regular.ttf?raw=true";
      name = "NotoSansDuployan-Regular.ttf";
      sha256 = "e18ee5ffd6a456541bb6f1c4db4a6d39f89ec1d2bacb2198f653da0d79b0dc8b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansDuployan-Regular.ttf $out/share/fonts/truetype/NotoSansDuployan-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Duployan";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
