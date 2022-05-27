{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-mende-kikakui-${version}";
  version = "2022-05-24-065742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansmendekikakui/NotoSansMendeKikakui-Regular.ttf?raw=true";
      name = "NotoSansMendeKikakui-Regular.ttf";
      sha256 = "732aa89620f926e431f01764362166042cfc309f24272db33fde8aac30911183";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansMendeKikakui-Regular.ttf $out/share/fonts/truetype/NotoSansMendeKikakui-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Mende Kikakui";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
