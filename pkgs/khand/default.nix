{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "khand-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/khand/Khand-Light.ttf?raw=true";
      name = "Khand-Light.ttf";
      sha256 = "52429cff48e8a2a77a63940ca7f7957dfd404c2375691272fc7a386e33fe0055";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/khand/Khand-Regular.ttf?raw=true";
      name = "Khand-Regular.ttf";
      sha256 = "fb2b604a80f9fd6e3532b1f25c964bf56002240e2da0ea7a7265eec7bb4bc519";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/khand/Khand-Medium.ttf?raw=true";
      name = "Khand-Medium.ttf";
      sha256 = "40405d6ac45cec61455b960bc13a353536b9787dff38e8070ad3b9cc18a80639";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/khand/Khand-SemiBold.ttf?raw=true";
      name = "Khand-SemiBold.ttf";
      sha256 = "918cb97509c99fe0a9acb857dfa90e5524fc231791fedd76e6bc1f9d94fa038e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/khand/Khand-Bold.ttf?raw=true";
      name = "Khand-Bold.ttf";
      sha256 = "1e166cadaf044765dc41f99386756376d8b648c71e198133653c142a4e9a086e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Khand-Light.ttf $out/share/fonts/truetype/Khand-Light.ttf
     install -Dm644 Khand-Regular.ttf $out/share/fonts/truetype/Khand-Regular.ttf
     install -Dm644 Khand-Medium.ttf $out/share/fonts/truetype/Khand-Medium.ttf
     install -Dm644 Khand-SemiBold.ttf $out/share/fonts/truetype/Khand-SemiBold.ttf
     install -Dm644 Khand-Bold.ttf $out/share/fonts/truetype/Khand-Bold.ttf
  '';

  meta = with lib; {
    description = "Khand";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
