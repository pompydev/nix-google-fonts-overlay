{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nunito-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/604936664fd62c14271209b51f98e7f495dd1a3e/ofl/nunito/Nunito[wght].ttf?raw=true";
      name = "Nunito[wght].ttf";
      sha256 = "bb55a5ca5c2042335b3991af27c4d0705d0ef41cac6164ac737fd8f2a1e85207";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/604936664fd62c14271209b51f98e7f495dd1a3e/ofl/nunito/Nunito-Italic[wght].ttf?raw=true";
      name = "Nunito-Italic[wght].ttf";
      sha256 = "b520cc871868b0acfca1beda875df7f4a44ebce914f8a89f83977fc9c09529c8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Nunito[wght].ttf' $out/share/fonts/truetype/'Nunito[wght].ttf'
     install -Dm644 'Nunito-Italic[wght].ttf' $out/share/fonts/truetype/'Nunito-Italic[wght].ttf'
  '';

  meta = with lib; {
    description = "Nunito";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
