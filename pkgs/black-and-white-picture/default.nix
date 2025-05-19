{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "black-and-white-picture-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/blackandwhitepicture/BlackAndWhitePicture-Regular.ttf?raw=true";
      name = "BlackAndWhitePicture-Regular.ttf";
      sha256 = "4d72cd6de1f210b446c86f06b4e13d7641cbcfb1b375c6927341388aa8e08056";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BlackAndWhitePicture-Regular.ttf $out/share/fonts/truetype/BlackAndWhitePicture-Regular.ttf
  '';

  meta = with lib; {
    description = "Black And White Picture";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
