{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "content-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/content/Content-Regular.ttf?raw=true";
      name = "Content-Regular.ttf";
      sha256 = "b470db9d4ce6147203ff917c3ebadf3d31ebc78801a35aac4f7c090bf9b67802";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/content/Content-Bold.ttf?raw=true";
      name = "Content-Bold.ttf";
      sha256 = "3242d6b22201e6919c784a6d95d0284bc36ef6b38785fe002a8cfab18a3f841f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Content-Regular.ttf $out/share/fonts/truetype/Content-Regular.ttf
     install -Dm644 Content-Bold.ttf $out/share/fonts/truetype/Content-Bold.ttf
  '';

  meta = with lib; {
    description = "Content";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
