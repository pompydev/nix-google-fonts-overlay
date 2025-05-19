{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-syloti-nagri-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanssylotinagri/NotoSansSylotiNagri-Regular.ttf?raw=true";
      name = "NotoSansSylotiNagri-Regular.ttf";
      sha256 = "86125713777b45f80ea7f08abe9cc02e2e25cf9a475f8c7e15d29180ab980571";
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
