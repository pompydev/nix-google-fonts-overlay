{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mansalva-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/mansalva/Mansalva-Regular.ttf?raw=true";
      name = "Mansalva-Regular.ttf";
      sha256 = "613ca294f0a364fd282a06d5e8a65db5d8f2bb8b834f8b21437a53cf70dafb8a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Mansalva-Regular.ttf $out/share/fonts/truetype/Mansalva-Regular.ttf
  '';

  meta = with lib; {
    description = "Mansalva";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
