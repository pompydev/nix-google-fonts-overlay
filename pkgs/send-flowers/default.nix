{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "send-flowers-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/aa7ae34555d544a405bc396d37741551b670ec62/ofl/sendflowers/SendFlowers-Regular.ttf?raw=true";
      name = "SendFlowers-Regular.ttf";
      sha256 = "4c667e639f9c8a37c3d46663be0885245c3b0fbc283138cfa5d83135f3386c91";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SendFlowers-Regular.ttf $out/share/fonts/truetype/SendFlowers-Regular.ttf
  '';

  meta = with lib; {
    description = "Send Flowers";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
