{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "yanone-kaffeesatz-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/25240a5fc4a6bb412d1889c8d3e9ce7b39e1d9ce/ofl/yanonekaffeesatz/YanoneKaffeesatz[wght].ttf?raw=true";
      name = "YanoneKaffeesatz[wght].ttf";
      sha256 = "091690fb1f10d63848c3c1b417d5fce709a7a604a82ee44b465132922e23304f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'YanoneKaffeesatz[wght].ttf' $out/share/fonts/truetype/'YanoneKaffeesatz[wght].ttf'
  '';

  meta = with lib; {
    description = "Yanone Kaffeesatz";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
