{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "elsie-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f276fa823700a5278b88de6ebe41499f3d5f98a2/ofl/elsie/Elsie-Regular.ttf?raw=true";
      name = "Elsie-Regular.ttf";
      sha256 = "9b3ff5056866667fb29f60beb4522994afdd4d5f580626c6fd9e6f5bf49f1ea5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/702fc4554a93231b0bfab4fe9ac68ee653b9215d/ofl/elsie/Elsie-Black.ttf?raw=true";
      name = "Elsie-Black.ttf";
      sha256 = "69339fcd10a5d5c12b72cf5127b44be5a0147d2531baf494004c7adad4af6338";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Elsie-Regular.ttf $out/share/fonts/truetype/Elsie-Regular.ttf
     install -Dm644 Elsie-Black.ttf $out/share/fonts/truetype/Elsie-Black.ttf
  '';

  meta = with lib; {
    description = "Elsie";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
