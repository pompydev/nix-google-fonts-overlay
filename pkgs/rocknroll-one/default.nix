{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rocknroll-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/rocknrollone/RocknRollOne-Regular.ttf?raw=true";
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
