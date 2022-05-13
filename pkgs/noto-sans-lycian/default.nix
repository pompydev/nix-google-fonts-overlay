{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-lycian-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanslycian/NotoSansLycian-Regular.ttf?raw=true";
      name = "NotoSansLycian-Regular.ttf";
      sha256 = "e75284df85c8ea4b55023d39d5452b8a8855f5fa02a497087eeeb30a32008a62";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansLycian-Regular.ttf $out/share/fonts/truetype/NotoSansLycian-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Lycian";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
