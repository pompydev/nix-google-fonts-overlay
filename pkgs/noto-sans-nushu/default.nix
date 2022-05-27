{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-nushu-${version}";
  version = "2022-05-24-075352";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansnushu/NotoSansNushu-Regular.ttf?raw=true";
      name = "NotoSansNushu-Regular.ttf";
      sha256 = "9a59c6a764740a008aad18ea495c27185176e4840cfa13c848f3a86c707af88f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansNushu-Regular.ttf $out/share/fonts/truetype/NotoSansNushu-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Nushu";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
