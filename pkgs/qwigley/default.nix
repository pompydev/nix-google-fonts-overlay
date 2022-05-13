{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "qwigley-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/82139bf16dcf542bfa931ec07c8ceb517eb28c70/ofl/qwigley/Qwigley-Regular.ttf?raw=true";
      name = "Qwigley-Regular.ttf";
      sha256 = "6a018d872fa8ad613a71a48383b3f0f987a0e7cd305678ca3a7c87648e6cdbb2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Qwigley-Regular.ttf $out/share/fonts/truetype/Qwigley-Regular.ttf
  '';

  meta = with lib; {
    description = "Qwigley";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
