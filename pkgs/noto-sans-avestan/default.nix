{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-avestan-${version}";
  version = "2022-05-24-065742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansavestan/NotoSansAvestan-Regular.ttf?raw=true";
      name = "NotoSansAvestan-Regular.ttf";
      sha256 = "7b12c0e594f8b13b9148763318238742a74dfe57032752238a0df3bd1a566331";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansAvestan-Regular.ttf $out/share/fonts/truetype/NotoSansAvestan-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Avestan";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
