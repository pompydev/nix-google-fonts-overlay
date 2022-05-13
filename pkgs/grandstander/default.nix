{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "grandstander-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ae1d37ea926356900bd195a1e063f465d61e15d7/ofl/grandstander/Grandstander[wght].ttf?raw=true";
      name = "Grandstander[wght].ttf";
      sha256 = "fbc7d1d934e6aa7842f7e8420cd833eca9eb123d61880075eec68751369e2f13";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ae1d37ea926356900bd195a1e063f465d61e15d7/ofl/grandstander/Grandstander-Italic[wght].ttf?raw=true";
      name = "Grandstander-Italic[wght].ttf";
      sha256 = "22ba556757942fd2b3d87aa087ce88d7222492c5440c4f009144770dcb68bd0d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Grandstander[wght].ttf' $out/share/fonts/truetype/'Grandstander[wght].ttf'
     install -Dm644 'Grandstander-Italic[wght].ttf' $out/share/fonts/truetype/'Grandstander-Italic[wght].ttf'
  '';

  meta = with lib; {
    description = "Grandstander";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
