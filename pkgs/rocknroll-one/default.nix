{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rocknroll-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/rocknrollone/RocknRollOne-Regular.ttf?raw=true";
      name = "RocknRollOne-Regular.ttf";
      sha256 = "dc0f5ff975851827f63f2c6bfed128ffbca14b6399a10fb5e1711215c0108526";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RocknRollOne-Regular.ttf $out/share/fonts/truetype/RocknRollOne-Regular.ttf
  '';

  meta = with lib; {
    description = "RocknRoll One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
