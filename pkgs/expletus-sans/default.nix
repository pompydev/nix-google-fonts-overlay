{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "expletus-sans-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/37c8dee94d1dfb2b7b79d7610744bcd44442d6d1/ofl/expletussans/ExpletusSans[wght].ttf?raw=true";
      name = "ExpletusSans[wght].ttf";
      sha256 = "33508b3b477c548ac00179d97c6deaca1e98dab4cc1d869dec5815931e7540f8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/37c8dee94d1dfb2b7b79d7610744bcd44442d6d1/ofl/expletussans/ExpletusSans-Italic[wght].ttf?raw=true";
      name = "ExpletusSans-Italic[wght].ttf";
      sha256 = "5e69f9842ef3bddf9db581642306216f9d25649b9f9de2e80944e694ac189799";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'ExpletusSans[wght].ttf' $out/share/fonts/truetype/'ExpletusSans[wght].ttf'
     install -Dm644 'ExpletusSans-Italic[wght].ttf' $out/share/fonts/truetype/'ExpletusSans-Italic[wght].ttf'
  '';

  meta = with lib; {
    description = "Expletus Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
