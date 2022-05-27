{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "zen-kurenaido-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/301365039c8637f7a5420e65bac7f57a54421b04/ofl/zenkurenaido/ZenKurenaido-Regular.ttf?raw=true";
      name = "ZenKurenaido-Regular.ttf";
      sha256 = "58b8d930d9fc10c8a5810c085bae378dacb98d0779073ee6d53d919f19ee6a4f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ZenKurenaido-Regular.ttf $out/share/fonts/truetype/ZenKurenaido-Regular.ttf
  '';

  meta = with lib; {
    description = "Zen Kurenaido";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
