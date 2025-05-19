{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-nandinagari-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansnandinagari/NotoSansNandinagari-Regular.ttf?raw=true";
      name = "NotoSansNandinagari-Regular.ttf";
      sha256 = "ed326d58e570027ecff41cb3f0286a389f52118bf1313273e4ce2faa3d5d5f51";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansNandinagari-Regular.ttf $out/share/fonts/truetype/NotoSansNandinagari-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Nandinagari";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
