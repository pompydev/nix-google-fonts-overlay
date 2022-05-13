{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-mongolian-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansmongolian/NotoSansMongolian-Regular.ttf?raw=true";
      name = "NotoSansMongolian-Regular.ttf";
      sha256 = "601afb9f08fbbc39f0cf72cb7e11079ada6fa3feed1fadca8e6e5095e7957687";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansMongolian-Regular.ttf $out/share/fonts/truetype/NotoSansMongolian-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Mongolian";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
