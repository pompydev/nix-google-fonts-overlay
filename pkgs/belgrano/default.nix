{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "belgrano-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/belgrano/Belgrano-Regular.ttf?raw=true";
      name = "Belgrano-Regular.ttf";
      sha256 = "5bf095dfbc56718bea7d74c0b30c36413714aaf8833d2cb012b604b64fd383d9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Belgrano-Regular.ttf $out/share/fonts/truetype/Belgrano-Regular.ttf
  '';

  meta = with lib; {
    description = "Belgrano";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
