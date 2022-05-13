{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-adlam-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansadlam/NotoSansAdlam[wght].ttf?raw=true";
      name = "NotoSansAdlam[wght].ttf";
      sha256 = "078496d52544f6e5c8e6d8fd8b858938428b7ce228115b1c91aa8be3ff366ef9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'NotoSansAdlam[wght].ttf' $out/share/fonts/truetype/'NotoSansAdlam[wght].ttf'
  '';

  meta = with lib; {
    description = "Noto Sans Adlam";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
