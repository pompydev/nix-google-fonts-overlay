{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "libre-bodoni-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/librebodoni/LibreBodoni%5Bwght%5D.ttf?raw=true";
      name = "LibreBodoni_wght_.ttf";
      sha256 = "0d543665bd869819ffd7d46608804e245497ba835960832d44be89e561b0c717";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/librebodoni/LibreBodoni-Italic%5Bwght%5D.ttf?raw=true";
      name = "LibreBodoni-Italic_wght_.ttf";
      sha256 = "6a9b0c88764dcf6c094653e3c28da045fcebca48734254afdcbfec46b9ab4fcd";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LibreBodoni_wght_.ttf $out/share/fonts/truetype/LibreBodoni_wght_.ttf
     install -Dm644 LibreBodoni-Italic_wght_.ttf $out/share/fonts/truetype/LibreBodoni-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Libre Bodoni";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
