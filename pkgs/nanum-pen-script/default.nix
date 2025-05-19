{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nanum-pen-script-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/nanumpenscript/NanumPenScript-Regular.ttf?raw=true";
      name = "NanumPenScript-Regular.ttf";
      sha256 = "6f0d1ab29c7894010dc88831fb7a0a51edb79136e450344183de5b1a8b52bd43";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NanumPenScript-Regular.ttf $out/share/fonts/truetype/NanumPenScript-Regular.ttf
  '';

  meta = with lib; {
    description = "Nanum Pen Script";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
