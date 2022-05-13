{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-medefaidrin-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansmedefaidrin/NotoSansMedefaidrin[wght].ttf?raw=true";
      name = "NotoSansMedefaidrin[wght].ttf";
      sha256 = "f83008aea2ad8feb72776e1e2a9483de98eab53d81cb286c2247051aea2fe021";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'NotoSansMedefaidrin[wght].ttf' $out/share/fonts/truetype/'NotoSansMedefaidrin[wght].ttf'
  '';

  meta = with lib; {
    description = "Noto Sans Medefaidrin";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
