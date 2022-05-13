{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-old-south-arabian-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansoldsoutharabian/NotoSansOldSouthArabian-Regular.ttf?raw=true";
      name = "NotoSansOldSouthArabian-Regular.ttf";
      sha256 = "e6cc76f093f7ae30373701f18f061bd7941841fb3775041c9c343b47e96c5d05";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansOldSouthArabian-Regular.ttf $out/share/fonts/truetype/NotoSansOldSouthArabian-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Old South Arabian";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
