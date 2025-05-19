{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-syriac-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanssyriac/NotoSansSyriac%5Bwght%5D.ttf?raw=true";
      name = "NotoSansSyriac_wght_.ttf";
      sha256 = "775585cc3c12877115d588f70af3aa140c78cb440f9d42c98273bf05bed3f6b1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansSyriac_wght_.ttf $out/share/fonts/truetype/NotoSansSyriac_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Syriac";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
