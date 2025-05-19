{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-caucasian-albanian-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanscaucasianalbanian/NotoSansCaucasianAlbanian-Regular.ttf?raw=true";
      name = "NotoSansCaucasianAlbanian-Regular.ttf";
      sha256 = "7d5a81e7f9f90eb1aaef9935b2c4d68b6300939a2df9dbb9472b38a4fbec50bc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansCaucasianAlbanian-Regular.ttf $out/share/fonts/truetype/NotoSansCaucasianAlbanian-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Caucasian Albanian";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
