{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "corben-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/corben/Corben-Regular.ttf?raw=true";
      name = "Corben-Regular.ttf";
      sha256 = "dd2c2697a8f936a43b5f0a2bae1bc82cdaf40f8a5fc1d15c1ecd562b3ea16044";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/corben/Corben-Bold.ttf?raw=true";
      name = "Corben-Bold.ttf";
      sha256 = "1fb5959682b89680467ab628e2f1e6359c6062acbb7edcea14ffcca1124db0f1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Corben-Regular.ttf $out/share/fonts/truetype/Corben-Regular.ttf
     install -Dm644 Corben-Bold.ttf $out/share/fonts/truetype/Corben-Bold.ttf
  '';

  meta = with lib; {
    description = "Corben";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
