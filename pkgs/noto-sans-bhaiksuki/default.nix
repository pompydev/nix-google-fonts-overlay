{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-bhaiksuki-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansbhaiksuki/NotoSansBhaiksuki-Regular.ttf?raw=true";
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
