{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "inspiration-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/245758c4de61324a7a7d28d564e9af8333968623/ofl/inspiration/Inspiration-Regular.ttf?raw=true";
      name = "Inspiration-Regular.ttf";
      sha256 = "4308040c6993a16772fb6a09d8b38e0ae0222c81c60615cf4d80aad0e3dfabf6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Inspiration-Regular.ttf $out/share/fonts/truetype/Inspiration-Regular.ttf
  '';

  meta = with lib; {
    description = "Inspiration";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
