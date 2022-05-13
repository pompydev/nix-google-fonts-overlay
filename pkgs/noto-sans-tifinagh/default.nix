{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-tifinagh-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanstifinagh/NotoSansTifinagh-Regular.ttf?raw=true";
      name = "NotoSansTifinagh-Regular.ttf";
      sha256 = "176233c9dd5649184f3206680debc1a50b411a9229049e0b5d212776af1e2034";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansTifinagh-Regular.ttf $out/share/fonts/truetype/NotoSansTifinagh-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Tifinagh";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
