{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-osage-${version}";
  version = "2022-05-24-075352";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansosage/NotoSansOsage-Regular.ttf?raw=true";
      name = "NotoSansOsage-Regular.ttf";
      sha256 = "27d3b1ea74cc799025ed5e8b58d1a33185530c43fbb4119fffbcd161269477d3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansOsage-Regular.ttf $out/share/fonts/truetype/NotoSansOsage-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Osage";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
