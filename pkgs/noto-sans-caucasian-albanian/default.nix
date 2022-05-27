{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-caucasian-albanian-${version}";
  version = "2022-05-24-065742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanscaucasianalbanian/NotoSansCaucasianAlbanian-Regular.ttf?raw=true";
      name = "NotoSansCaucasianAlbanian-Regular.ttf";
      sha256 = "0faeefe156c6952e432ead92629ea3b835b060f45a01311ac27f3038c01888d9";
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
