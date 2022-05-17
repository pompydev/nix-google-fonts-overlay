{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "commissioner-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/10e4ce4aa815a1b5eab52b232247b7b49a213119/ofl/commissioner/Commissioner[slnt,wght].ttf?raw=true";
      name = "Commissioner_slnt,wght_.ttf";
      sha256 = "dec620ba895f7a52906568ed2271c3d6d8fccff3fd5ba8960a27c12a15d99bf2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Commissioner_slnt,wght_.ttf $out/share/fonts/truetype/Commissioner_slnt,wght_.ttf
  '';

  meta = with lib; {
    description = "Commissioner";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
