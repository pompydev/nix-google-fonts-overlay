{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "padyakke-expanded-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/padyakkeexpandedone/PadyakkeExpandedOne-Regular.ttf?raw=true";
      name = "PadyakkeExpandedOne-Regular.ttf";
      sha256 = "fcdc6cb3fc277895c98fc120acaf12d421c911bba768eba2891049b5df225032";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PadyakkeExpandedOne-Regular.ttf $out/share/fonts/truetype/PadyakkeExpandedOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Padyakke Expanded One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
