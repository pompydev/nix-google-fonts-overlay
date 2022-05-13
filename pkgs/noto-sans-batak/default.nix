{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-batak-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansbatak/NotoSansBatak-Regular.ttf?raw=true";
      name = "NotoSansBatak-Regular.ttf";
      sha256 = "d7913a9681f6bf3f63a3c87f34c87d20bcf8515aceee9c081dc2851292f4efa4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansBatak-Regular.ttf $out/share/fonts/truetype/NotoSansBatak-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Batak";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
