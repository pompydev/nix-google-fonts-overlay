{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bitter-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7aca1ebb5db6fbe957ed765cc800b0b148a9539d/ofl/bitter/Bitter[wght].ttf?raw=true";
      name = "Bitter[wght].ttf";
      sha256 = "238fa4ba51402494ff57d3ab46b4ba0e84628f76246a10939e24aeeabf6ac260";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7aca1ebb5db6fbe957ed765cc800b0b148a9539d/ofl/bitter/Bitter-Italic[wght].ttf?raw=true";
      name = "Bitter-Italic[wght].ttf";
      sha256 = "491bbab78a63af62ad750e6f8f0d1f05997215a5be24031c3dcb270b062c6267";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Bitter[wght].ttf' $out/share/fonts/truetype/'Bitter[wght].ttf'
     install -Dm644 'Bitter-Italic[wght].ttf' $out/share/fonts/truetype/'Bitter-Italic[wght].ttf'
  '';

  meta = with lib; {
    description = "Bitter";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
