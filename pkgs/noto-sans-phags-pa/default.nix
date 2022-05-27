{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-phags-pa-${version}";
  version = "2022-05-24-075352";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansphagspa/NotoSansPhagsPa-Regular.ttf?raw=true";
      name = "NotoSansPhagsPa-Regular.ttf";
      sha256 = "26e1100003585ae36f3e88569626e4e0d99af3f835cb118fe27919d76351047b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansPhagsPa-Regular.ttf $out/share/fonts/truetype/NotoSansPhagsPa-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Phags Pa";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
