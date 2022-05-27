{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-hanunoo-${version}";
  version = "2022-05-24-065742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanshanunoo/NotoSansHanunoo-Regular.ttf?raw=true";
      name = "NotoSansHanunoo-Regular.ttf";
      sha256 = "63e65378a4f2bbbdeb5f3bf1641baa4d4908a1808390450ec40abff3c94800d9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansHanunoo-Regular.ttf $out/share/fonts/truetype/NotoSansHanunoo-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Hanunoo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
