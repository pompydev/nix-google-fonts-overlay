{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "abeezee-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/abeezee/ABeeZee-Regular.ttf?raw=true";
      name = "ABeeZee-Regular.ttf";
      sha256 = "2901c8df256648cc2bb2e3afb381cb8d28e65ed3dbe11de20695ae4d5ffdeda9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/abeezee/ABeeZee-Italic.ttf?raw=true";
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
