{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-thai-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoserifthai/NotoSerifThai%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSerifThai_wdth,wght_.ttf";
      sha256 = "34a7ad11647c845303aabdde639059806c56b84719e5d2ceb28eb038711bdf53";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifThai_wdth-wght_.ttf $out/share/fonts/truetype/NotoSerifThai_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Thai";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
