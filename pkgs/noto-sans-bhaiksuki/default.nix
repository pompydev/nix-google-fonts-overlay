{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-bhaiksuki-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansbhaiksuki/NotoSansBhaiksuki-Regular.ttf?raw=true";
      name = "NotoSansBhaiksuki-Regular.ttf";
      sha256 = "eac343bece0d783218f3ab574df20217c0e165de3d04cd6fef8b47934605e0d9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansBhaiksuki-Regular.ttf $out/share/fonts/truetype/NotoSansBhaiksuki-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Bhaiksuki";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
