{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "alice-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/alice/Alice-Regular.ttf?raw=true";
      name = "Alice-Regular.ttf";
      sha256 = "8212c40f10b306af9b82272ae68314de6964522b6dabf6abdaff647e74ac8b58";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Alice-Regular.ttf $out/share/fonts/truetype/Alice-Regular.ttf
  '';

  meta = with lib; {
    description = "Alice";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
