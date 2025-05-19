{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tenali-ramakrishna-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/tenaliramakrishna/TenaliRamakrishna-Regular.ttf?raw=true";
      name = "TenaliRamakrishna-Regular.ttf";
      sha256 = "270de242b3a71275be5919cd1d5aefa272ae4a996d45e83b9672e15152caa4b8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 TenaliRamakrishna-Regular.ttf $out/share/fonts/truetype/TenaliRamakrishna-Regular.ttf
  '';

  meta = with lib; {
    description = "Tenali Ramakrishna";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
