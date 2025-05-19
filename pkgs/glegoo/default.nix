{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "glegoo-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/glegoo/Glegoo-Regular.ttf?raw=true";
      name = "Glegoo-Regular.ttf";
      sha256 = "237ca320ef867416c46c6fdfa6edc2ac5f49a121396ad0279a2e0f8ed7aaa3b1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/glegoo/Glegoo-Bold.ttf?raw=true";
      name = "Glegoo-Bold.ttf";
      sha256 = "8ad5922db134fe9bf9f2691fc5554293c06884cf89823f452fc76db6b3de7fef";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Glegoo-Regular.ttf $out/share/fonts/truetype/Glegoo-Regular.ttf
     install -Dm644 Glegoo-Bold.ttf $out/share/fonts/truetype/Glegoo-Bold.ttf
  '';

  meta = with lib; {
    description = "Glegoo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
