{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "syne-mono-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/synemono/SyneMono-Regular.ttf?raw=true";
      name = "SyneMono-Regular.ttf";
      sha256 = "b142b088680791725849cc74c54d7937c981de2378583bde72f826bd3eb267dc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SyneMono-Regular.ttf $out/share/fonts/truetype/SyneMono-Regular.ttf
  '';

  meta = with lib; {
    description = "Syne Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
