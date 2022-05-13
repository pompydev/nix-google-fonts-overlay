{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-khojki-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanskhojki/NotoSansKhojki-Regular.ttf?raw=true";
      name = "NotoSansKhojki-Regular.ttf";
      sha256 = "535cb9a795b8bd6e2c5f899574cd6bd26c267d0431aa7b03d6d8ac25ef0c9183";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansKhojki-Regular.ttf $out/share/fonts/truetype/NotoSansKhojki-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Khojki";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
