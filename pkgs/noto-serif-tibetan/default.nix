{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-tibetan-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notoseriftibetan/NotoSerifTibetan%5Bwght%5D.ttf?raw=true";
      name = "NotoSerifTibetan_wght_.ttf";
      sha256 = "4161f9e40b82542e60faeb6f87edb147480e3964280344438f4875a676058fce";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifTibetan_wght_.ttf $out/share/fonts/truetype/NotoSerifTibetan_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Tibetan";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
