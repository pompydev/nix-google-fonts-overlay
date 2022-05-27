{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cairo-${version}";
  version = "2022-05-23-211740";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/ea017b81484c44a68dee2bce96205d115925916d/ofl/cairo/Cairo%5Bwght%5D.ttf?raw=true";
      name = "Cairo_wght_.ttf";
      sha256 = "d9929c901a57f7e29ba0eaf6f2979f8ab95c6f0170b9a0d914d61d6487a8959e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Cairo_wght_.ttf $out/share/fonts/truetype/Cairo_wght_.ttf
  '';

  meta = with lib; {
    description = "Cairo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
