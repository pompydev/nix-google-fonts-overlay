{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "judson-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/judson/Judson-Regular.ttf?raw=true";
      name = "Judson-Regular.ttf";
      sha256 = "73790bf79197e5bbf24178df3841ff27fb2fca05dd1f17fc1046e4bbe16caf95";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/judson/Judson-Italic.ttf?raw=true";
      name = "Judson-Italic.ttf";
      sha256 = "2bddaed218ead284599fcdcc2889dfb59e804f89db48779e05c0ee87216fdd8f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/judson/Judson-Bold.ttf?raw=true";
      name = "Judson-Bold.ttf";
      sha256 = "07e77390c353d7e4e69862b91e0a79f6774b19d1602b5f4a504ed15ef6f1023c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Judson-Regular.ttf $out/share/fonts/truetype/Judson-Regular.ttf
     install -Dm644 Judson-Italic.ttf $out/share/fonts/truetype/Judson-Italic.ttf
     install -Dm644 Judson-Bold.ttf $out/share/fonts/truetype/Judson-Bold.ttf
  '';

  meta = with lib; {
    description = "Judson";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
