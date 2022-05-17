{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-bamum-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansbamum/NotoSansBamum%5Bwght%5D.ttf?raw=true";
      name = "NotoSansBamum_wght_.ttf";
      sha256 = "7610a9ae25b9d174e734b8ab0f5924ced28d51d444a8e1da21655c3a9f9f957d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansBamum_wght_.ttf $out/share/fonts/truetype/NotoSansBamum_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Bamum";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
