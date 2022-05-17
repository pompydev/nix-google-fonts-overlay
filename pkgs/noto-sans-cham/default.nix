{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-cham-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanscham/NotoSansCham%5Bwght%5D.ttf?raw=true";
      name = "NotoSansCham_wght_.ttf";
      sha256 = "ddee7a7e601b130392213ee10c1f7d239977861dcf229c293cf18eb1706e158a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansCham_wght_.ttf $out/share/fonts/truetype/NotoSansCham_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Cham";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
