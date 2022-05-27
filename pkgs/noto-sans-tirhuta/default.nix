{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-tirhuta-${version}";
  version = "2022-05-24-065742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanstirhuta/NotoSansTirhuta-Regular.ttf?raw=true";
      name = "NotoSansTirhuta-Regular.ttf";
      sha256 = "6c2b525937ea47a0898a2a69675d84673f154f06d36aef5573f767ebdbdfefa0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansTirhuta-Regular.ttf $out/share/fonts/truetype/NotoSansTirhuta-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Tirhuta";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
