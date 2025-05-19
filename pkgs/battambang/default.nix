{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "battambang-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/battambang/Battambang-Thin.ttf?raw=true";
      name = "Battambang-Thin.ttf";
      sha256 = "8e02ceb59104791191d7370324a75c4e74e85623691272507f8bde3c83d7a8d9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/battambang/Battambang-Light.ttf?raw=true";
      name = "Battambang-Light.ttf";
      sha256 = "282626df0ef99cdba8e2519e63705de621d1cf29c3d323a1d8e424df1caea5ed";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/battambang/Battambang-Regular.ttf?raw=true";
      name = "Battambang-Regular.ttf";
      sha256 = "1fd3eb9960911396cb7955f2c68afe5ee21c2c14f8097e945d05b768ed4de942";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/battambang/Battambang-Bold.ttf?raw=true";
      name = "Battambang-Bold.ttf";
      sha256 = "4cd10f7a56a7d9d1fb4184b2219821f8ad6f425be290243ef73c4ef3a80c86ff";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/battambang/Battambang-Black.ttf?raw=true";
      name = "Battambang-Black.ttf";
      sha256 = "4426332a541f6cc85489813b11d99b8a1aaca53b313f8deb21b403a3d58286dd";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Battambang-Thin.ttf $out/share/fonts/truetype/Battambang-Thin.ttf
     install -Dm644 Battambang-Light.ttf $out/share/fonts/truetype/Battambang-Light.ttf
     install -Dm644 Battambang-Regular.ttf $out/share/fonts/truetype/Battambang-Regular.ttf
     install -Dm644 Battambang-Bold.ttf $out/share/fonts/truetype/Battambang-Bold.ttf
     install -Dm644 Battambang-Black.ttf $out/share/fonts/truetype/Battambang-Black.ttf
  '';

  meta = with lib; {
    description = "Battambang";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
