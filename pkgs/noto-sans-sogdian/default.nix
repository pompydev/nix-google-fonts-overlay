{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-sogdian-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanssogdian/NotoSansSogdian-Regular.ttf?raw=true";
      name = "NotoSansSogdian-Regular.ttf";
      sha256 = "e1575de303408101b8c8a6f1a812936b2b2e2eab5d9cab6b1926883f3fd73642";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansSogdian-Regular.ttf $out/share/fonts/truetype/NotoSansSogdian-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Sogdian";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
