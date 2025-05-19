{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-miao-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansmiao/NotoSansMiao-Regular.ttf?raw=true";
      name = "NotoSansMiao-Regular.ttf";
      sha256 = "aeb7a17dd44e8e2027d717cec2b14629f82cb741a7d1a6e4b325e99cb69073ab";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansMiao-Regular.ttf $out/share/fonts/truetype/NotoSansMiao-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Miao";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
