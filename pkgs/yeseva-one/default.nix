{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "yeseva-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/yesevaone/YesevaOne-Regular.ttf?raw=true";
      name = "YesevaOne-Regular.ttf";
      sha256 = "88362b33820f0011e163e67b1d570fecd442aa8c05eaac89d5162f9c40d9dac3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 YesevaOne-Regular.ttf $out/share/fonts/truetype/YesevaOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Yeseva One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
