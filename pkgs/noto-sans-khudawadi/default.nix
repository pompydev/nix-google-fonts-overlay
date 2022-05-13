{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-khudawadi-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanskhudawadi/NotoSansKhudawadi-Regular.ttf?raw=true";
      name = "NotoSansKhudawadi-Regular.ttf";
      sha256 = "6f53c75ea5477f4ad68d32eff8d2cc0d0ec21600744c0804f3c6ad4f29006541";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansKhudawadi-Regular.ttf $out/share/fonts/truetype/NotoSansKhudawadi-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Khudawadi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
