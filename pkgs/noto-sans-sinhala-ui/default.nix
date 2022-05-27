{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-sinhala-ui-${version}";
  version = "2022-05-24-075352";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanssinhalaui/NotoSansSinhalaUI%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansSinhalaUI_wdth,wght_.ttf";
      sha256 = "3daf1ec98108a0705b4d197424492d0955386a9bc76a7838ec9f31db47c1fc32";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansSinhalaUI_wdth,wght_.ttf $out/share/fonts/truetype/NotoSansSinhalaUI_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Sinhala UI";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
