{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-kaithi-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanskaithi/NotoSansKaithi-Regular.ttf?raw=true";
      name = "NotoSansKaithi-Regular.ttf";
      sha256 = "d217c8bc858594b12e13d0d4accce754284c8f80b5531313ddd1dc2359e03f0f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansKaithi-Regular.ttf $out/share/fonts/truetype/NotoSansKaithi-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Kaithi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
