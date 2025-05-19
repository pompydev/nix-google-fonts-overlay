{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-au-sa-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwriteausa/PlaywriteAUSA%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteAUSA_wght_.ttf";
      sha256 = "cecda148c7f29bb562e634a03018122599e8853a6eaeffd230ff8155ccebc29c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteAUSA_wght_.ttf $out/share/fonts/truetype/PlaywriteAUSA_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite AU SA";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
