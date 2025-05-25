{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-syloti-nagri-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanssylotinagri/NotoSansSylotiNagri-Regular.ttf?raw=true";
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
