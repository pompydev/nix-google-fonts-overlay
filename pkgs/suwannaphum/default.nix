{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "suwannaphum-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4f5dbdb58c9075640112a760b0f2376ab04cd187/ofl/suwannaphum/Suwannaphum-Thin.ttf?raw=true";
      name = "Suwannaphum-Thin.ttf";
      sha256 = "a7622a399293c36352a182d829d71b90bf8e711416c9ed551434a15451933766";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4f5dbdb58c9075640112a760b0f2376ab04cd187/ofl/suwannaphum/Suwannaphum-Light.ttf?raw=true";
      name = "Suwannaphum-Light.ttf";
      sha256 = "4c63d8be65e55a9b755385c6114d9e40dd3d00542cb7581d321e41b029826be9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4f5dbdb58c9075640112a760b0f2376ab04cd187/ofl/suwannaphum/Suwannaphum-Regular.ttf?raw=true";
      name = "Suwannaphum-Regular.ttf";
      sha256 = "f10e67bb256c78c126ac9def562a933ac44a51e5fa0cebea2a6234faa55de4a5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4f5dbdb58c9075640112a760b0f2376ab04cd187/ofl/suwannaphum/Suwannaphum-Bold.ttf?raw=true";
      name = "Suwannaphum-Bold.ttf";
      sha256 = "8afa1154b77de9be28248395160cf5f94cda7847aca123971af212e074d6f83d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4f5dbdb58c9075640112a760b0f2376ab04cd187/ofl/suwannaphum/Suwannaphum-Black.ttf?raw=true";
      name = "Suwannaphum-Black.ttf";
      sha256 = "c68112a98a143165dcf231b04a335497f6c028214006b0e1ad5905d65d0a2906";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Suwannaphum-Thin.ttf $out/share/fonts/truetype/Suwannaphum-Thin.ttf
     install -Dm644 Suwannaphum-Light.ttf $out/share/fonts/truetype/Suwannaphum-Light.ttf
     install -Dm644 Suwannaphum-Regular.ttf $out/share/fonts/truetype/Suwannaphum-Regular.ttf
     install -Dm644 Suwannaphum-Bold.ttf $out/share/fonts/truetype/Suwannaphum-Bold.ttf
     install -Dm644 Suwannaphum-Black.ttf $out/share/fonts/truetype/Suwannaphum-Black.ttf
  '';

  meta = with lib; {
    description = "Suwannaphum";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
