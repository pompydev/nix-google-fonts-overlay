{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "yuji-mai-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/807bf6c8eb6a18198f7944895bb8ec114ba5f381/ofl/yujimai/YujiMai-Regular.ttf?raw=true";
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
