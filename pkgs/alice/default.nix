{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "alice-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/edfdc270a7be7c4c29d3f24914e2e00410d1faa8/ofl/alice/Alice-Regular.ttf?raw=true";
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
