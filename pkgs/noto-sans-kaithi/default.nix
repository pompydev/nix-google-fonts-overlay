{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-kaithi-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanskaithi/NotoSansKaithi-Regular.ttf?raw=true";
      name = "NotoSansKaithi-Regular.ttf";
      sha256 = "e33f6b7e0c9d3c4edfb3f9bf9c00b0814bef14f25fef9d2c6a8d1451520ffe43";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansKaithi-Regular.ttf $out/share/fonts/truetype/NotoSansKaithi-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Kaithi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
