{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "caladea-${version}";
  version = "2022-05-23-211740";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ae5de9569e6af9ef0242e5b840bbbea651d2287e/ofl/caladea/Caladea-Regular.ttf?raw=true";
      name = "Caladea-Regular.ttf";
      sha256 = "f1e899278b7b4491aba5b6a8253c4b04c050cc59b21865be5c37559a775153cd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ae5de9569e6af9ef0242e5b840bbbea651d2287e/ofl/caladea/Caladea-Italic.ttf?raw=true";
      name = "Caladea-Italic.ttf";
      sha256 = "4359a8e24f748b6447b1ff6d7a174febe70961d29f8bb8634b56dacd740a3deb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ae5de9569e6af9ef0242e5b840bbbea651d2287e/ofl/caladea/Caladea-Bold.ttf?raw=true";
      name = "Caladea-Bold.ttf";
      sha256 = "ae3cb2dcbc925809dd29d2a44e9802211cab66be541bacbfc9c08c74b27c3742";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ae5de9569e6af9ef0242e5b840bbbea651d2287e/ofl/caladea/Caladea-BoldItalic.ttf?raw=true";
      name = "Caladea-BoldItalic.ttf";
      sha256 = "ccabaa7b7e2fdf253d2b1a5fa699dd8a3df8d835a9eb285ad82631a677eb76c0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Caladea-Regular.ttf $out/share/fonts/truetype/Caladea-Regular.ttf
     install -Dm644 Caladea-Italic.ttf $out/share/fonts/truetype/Caladea-Italic.ttf
     install -Dm644 Caladea-Bold.ttf $out/share/fonts/truetype/Caladea-Bold.ttf
     install -Dm644 Caladea-BoldItalic.ttf $out/share/fonts/truetype/Caladea-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Caladea";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
