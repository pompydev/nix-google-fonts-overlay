{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "abeezee-${version}";
  version = "2022-05-23-195233";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a8bc01c6dcb2933dca0f37180df6c516e226b346/ofl/abeezee/ABeeZee-Regular.ttf?raw=true";
      name = "ABeeZee-Regular.ttf";
      sha256 = "2901c8df256648cc2bb2e3afb381cb8d28e65ed3dbe11de20695ae4d5ffdeda9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a8bc01c6dcb2933dca0f37180df6c516e226b346/ofl/abeezee/ABeeZee-Italic.ttf?raw=true";
      name = "ABeeZee-Italic.ttf";
      sha256 = "3892bb74578207ed6edae040a0869e54dcae13a466d005460570947062137dd8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ABeeZee-Regular.ttf $out/share/fonts/truetype/ABeeZee-Regular.ttf
     install -Dm644 ABeeZee-Italic.ttf $out/share/fonts/truetype/ABeeZee-Italic.ttf
  '';

  meta = with lib; {
    description = "ABeeZee";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
