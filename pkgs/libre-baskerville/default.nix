{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "libre-baskerville-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/librebaskerville/LibreBaskerville-Regular.ttf?raw=true";
      name = "LibreBaskerville-Regular.ttf";
      sha256 = "f6553cf1a8dc8092a073b0135b254f5f7261306e608d9b85485a321878e804ac";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/librebaskerville/LibreBaskerville-Italic.ttf?raw=true";
      name = "LibreBaskerville-Italic.ttf";
      sha256 = "5ed54bfcac9ecd3e7cbaba07243b3848dbd49d6ffed18cbdde43edc5694bef95";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/librebaskerville/LibreBaskerville-Bold.ttf?raw=true";
      name = "LibreBaskerville-Bold.ttf";
      sha256 = "6f329db31dea139b15210963fadcea6f37fbfddf1f28669e257da9eda8cb9849";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LibreBaskerville-Regular.ttf $out/share/fonts/truetype/LibreBaskerville-Regular.ttf
     install -Dm644 LibreBaskerville-Italic.ttf $out/share/fonts/truetype/LibreBaskerville-Italic.ttf
     install -Dm644 LibreBaskerville-Bold.ttf $out/share/fonts/truetype/LibreBaskerville-Bold.ttf
  '';

  meta = with lib; {
    description = "Libre Baskerville";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
