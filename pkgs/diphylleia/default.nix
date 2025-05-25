{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "diphylleia-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/diphylleia/Diphylleia-Regular.ttf?raw=true";
      name = "Diphylleia-Regular.ttf";
      sha256 = "a0f505e19758bbe69da3e1cdd89fac74e69e851aa82195a61c861bcee7a53293";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Diphylleia-Regular.ttf $out/share/fonts/truetype/Diphylleia-Regular.ttf
  '';

  meta = with lib; {
    description = "Diphylleia";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
