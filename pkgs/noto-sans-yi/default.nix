{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-yi-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansyi/NotoSansYi-Regular.ttf?raw=true";
      name = "NotoSansYi-Regular.ttf";
      sha256 = "f621f514dce105a414ef7373a36b54ccc8d760a6319ad7133695fb42a1f02552";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansYi-Regular.ttf $out/share/fonts/truetype/NotoSansYi-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Yi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
