{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "yuji-mai-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/yujimai/YujiMai-Regular.ttf?raw=true";
      name = "YujiMai-Regular.ttf";
      sha256 = "05d83b65204a5de6fc34c222057fc082f8c6e2e44c05a0d28f4189b3e54c54c2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 YujiMai-Regular.ttf $out/share/fonts/truetype/YujiMai-Regular.ttf
  '';

  meta = with lib; {
    description = "Yuji Mai";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
