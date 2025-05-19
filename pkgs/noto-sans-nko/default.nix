{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-nko-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansnko/NotoSansNKo-Regular.ttf?raw=true";
      name = "NotoSansNKo-Regular.ttf";
      sha256 = "97954444367ad6708c36e85a89aec2830720e34968398d9caf07e7c3307c7993";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansNKo-Regular.ttf $out/share/fonts/truetype/NotoSansNKo-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans NKo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
