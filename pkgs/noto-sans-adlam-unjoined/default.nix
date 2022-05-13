{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-adlam-unjoined-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansadlamunjoined/NotoSansAdlamUnjoined[wght].ttf?raw=true";
      name = "NotoSansAdlamUnjoined[wght].ttf";
      sha256 = "55997df7decd05f31e0238154fb0a1092a25dfed8fcf9965a8898817688cd7e3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'NotoSansAdlamUnjoined[wght].ttf' $out/share/fonts/truetype/'NotoSansAdlamUnjoined[wght].ttf'
  '';

  meta = with lib; {
    description = "Noto Sans Adlam Unjoined";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
