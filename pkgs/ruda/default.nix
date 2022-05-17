{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ruda-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b275aee5408f826c7d929c8f93b61bd7a9ab81eb/ofl/ruda/Ruda[wght].ttf?raw=true";
      name = "Ruda_wght_.ttf";
      sha256 = "acc6e412c74545f934bed8564f8650f113d46d220f0f3a94484e6a6558cb40f0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Ruda_wght_.ttf $out/share/fonts/truetype/Ruda_wght_.ttf
  '';

  meta = with lib; {
    description = "Ruda";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
