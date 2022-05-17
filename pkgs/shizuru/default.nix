{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "shizuru-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1031401d9f1fb8372738a98d16706395a2be5585/ofl/shizuru/Shizuru-Regular.ttf?raw=true";
      name = "Shizuru-Regular.ttf";
      sha256 = "5954562e5fbb40fffe6361cbbcac0d4a4c9c5e2897d7b20876f294fbcc243f7f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Shizuru-Regular.ttf $out/share/fonts/truetype/Shizuru-Regular.ttf
  '';

  meta = with lib; {
    description = "Shizuru";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
