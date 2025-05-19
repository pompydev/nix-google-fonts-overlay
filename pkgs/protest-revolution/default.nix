{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "protest-revolution-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/protestrevolution/ProtestRevolution-Regular.ttf?raw=true";
      name = "ProtestRevolution-Regular.ttf";
      sha256 = "5e65722475fe7ea43ce8de724e01767b34edc8362b6738f54d720950fa2bffaa";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ProtestRevolution-Regular.ttf $out/share/fonts/truetype/ProtestRevolution-Regular.ttf
  '';

  meta = with lib; {
    description = "Protest Revolution";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
