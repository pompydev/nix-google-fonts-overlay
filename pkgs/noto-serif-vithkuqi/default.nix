{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-vithkuqi-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoserifvithkuqi/NotoSerifVithkuqi%5Bwght%5D.ttf?raw=true";
      name = "NotoSerifVithkuqi_wght_.ttf";
      sha256 = "964ed4f384e11f3bf552a6c2214c4fd16c9240d26942e001b4424cdbc470f8c4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifVithkuqi_wght_.ttf $out/share/fonts/truetype/NotoSerifVithkuqi_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Vithkuqi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
