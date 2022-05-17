{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "comforter-brush-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/097afc14a608c7a78fd997998f89dfd20727b719/ofl/comforterbrush/ComforterBrush-Regular.ttf?raw=true";
      name = "ComforterBrush-Regular.ttf";
      sha256 = "7bd357dc8bf83d71f27fd5155ece5c8c100a2042d4530e4487635473c5836f95";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ComforterBrush-Regular.ttf $out/share/fonts/truetype/ComforterBrush-Regular.ttf
  '';

  meta = with lib; {
    description = "Comforter Brush";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
