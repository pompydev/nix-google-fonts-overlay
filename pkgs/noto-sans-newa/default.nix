{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-newa-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansnewa/NotoSansNewa-Regular.ttf?raw=true";
      name = "NotoSansNewa-Regular.ttf";
      sha256 = "5a67f2e2a94eb493076dbb708a91ee4d48cd204c608f531077ad7c624b524e9e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansNewa-Regular.ttf $out/share/fonts/truetype/NotoSansNewa-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Newa";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
