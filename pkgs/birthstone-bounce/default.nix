{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "birthstone-bounce-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/birthstonebounce/BirthstoneBounce-Regular.ttf?raw=true";
      name = "BirthstoneBounce-Regular.ttf";
      sha256 = "a03b6146597d467e794fdd4d61178d72f083eb93e9e86040a10530aaa1307ef9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/birthstonebounce/BirthstoneBounce-Medium.ttf?raw=true";
      name = "BirthstoneBounce-Medium.ttf";
      sha256 = "ed8a0f1ad5ff82d617288e15268d6365412e3b793d17230610435b09474b31bc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BirthstoneBounce-Regular.ttf $out/share/fonts/truetype/BirthstoneBounce-Regular.ttf
     install -Dm644 BirthstoneBounce-Medium.ttf $out/share/fonts/truetype/BirthstoneBounce-Medium.ttf
  '';

  meta = with lib; {
    description = "Birthstone Bounce";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
