{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-nastaliq-urdu-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notonastaliqurdu/NotoNastaliqUrdu-Regular.ttf?raw=true";
      name = "NotoNastaliqUrdu-Regular.ttf";
      sha256 = "fe24c4a05b19482beac11e4b90a0f6754214f1cb5e925cf9e86b48283ac37522";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bbe747defd5df7db7ed13aa59b10d4b01395e236/ofl/notonastaliqurdu/NotoNastaliqUrdu-Bold.ttf?raw=true";
      name = "NotoNastaliqUrdu-Bold.ttf";
      sha256 = "78f7f19234b6c831a937678f7bbd04323e064366558cd0027b486e07dbc48216";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoNastaliqUrdu-Regular.ttf $out/share/fonts/truetype/NotoNastaliqUrdu-Regular.ttf
     install -Dm644 NotoNastaliqUrdu-Bold.ttf $out/share/fonts/truetype/NotoNastaliqUrdu-Bold.ttf
  '';

  meta = with lib; {
    description = "Noto Nastaliq Urdu";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
