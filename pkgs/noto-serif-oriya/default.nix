{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-oriya-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoseriforiya/NotoSerifOriya%5Bwght%5D.ttf?raw=true";
      name = "NotoSerifOriya_wght_.ttf";
      sha256 = "9fa2a08cb6a677d155a823bc58b4c587613780bd43013fd362369c251001502a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifOriya_wght_.ttf $out/share/fonts/truetype/NotoSerifOriya_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Oriya";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
