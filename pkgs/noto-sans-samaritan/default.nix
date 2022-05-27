{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-samaritan-${version}";
  version = "2022-05-24-075352";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanssamaritan/NotoSansSamaritan-Regular.ttf?raw=true";
      name = "NotoSansSamaritan-Regular.ttf";
      sha256 = "4878dd9a29f8d24ba1869c85ae5c3b7056e677a14b355135f3359b90b14e1ecc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansSamaritan-Regular.ttf $out/share/fonts/truetype/NotoSansSamaritan-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Samaritan";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
