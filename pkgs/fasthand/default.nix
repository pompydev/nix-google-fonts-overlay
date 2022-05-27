{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fasthand-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4f5dbdb58c9075640112a760b0f2376ab04cd187/ofl/fasthand/Fasthand-Regular.ttf?raw=true";
      name = "Fasthand-Regular.ttf";
      sha256 = "f4a151d4d01ab2daf53e67904efd2b943c17ac7b7351de4e6ee7bda7697b0a13";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Fasthand-Regular.ttf $out/share/fonts/truetype/Fasthand-Regular.ttf
  '';

  meta = with lib; {
    description = "Fasthand";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
