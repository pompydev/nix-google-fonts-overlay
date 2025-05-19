{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sniglet-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/sniglet/Sniglet-Regular.ttf?raw=true";
      name = "Sniglet-Regular.ttf";
      sha256 = "2856a975b9c0ac0402e8402ac4bd126cd97d6c90490435b6198d77e6384ae4f0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/sniglet/Sniglet-ExtraBold.ttf?raw=true";
      name = "Sniglet-ExtraBold.ttf";
      sha256 = "fb92a118e14b4bde101a0143895f570a54b070a307b359510b7703b5a94bb18c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Sniglet-Regular.ttf $out/share/fonts/truetype/Sniglet-Regular.ttf
     install -Dm644 Sniglet-ExtraBold.ttf $out/share/fonts/truetype/Sniglet-ExtraBold.ttf
  '';

  meta = with lib; {
    description = "Sniglet";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
