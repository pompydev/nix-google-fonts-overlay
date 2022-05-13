{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-tamil-ui-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanstamilui/NotoSansTamilUI[wdth,wght].ttf?raw=true";
      name = "NotoSansTamilUI[wdth,wght].ttf";
      sha256 = "66dabbaafd95cf14827b69b5ada6af1bdcde237b505e36ac215797f0dc9bc281";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'NotoSansTamilUI[wdth,wght].ttf' $out/share/fonts/truetype/'NotoSansTamilUI[wdth,wght].ttf'
  '';

  meta = with lib; {
    description = "Noto Sans Tamil UI";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
