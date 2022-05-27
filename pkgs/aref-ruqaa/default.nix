{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "aref-ruqaa-${version}";
  version = "2022-05-23-195233";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/de3320b54068a9e69748aa943e582294623fd3b5/ofl/arefruqaa/ArefRuqaa-Regular.ttf?raw=true";
      name = "ArefRuqaa-Regular.ttf";
      sha256 = "ceb786d83ba92f35e96efcd8623c2858d288e0c543c8761ba35b1020989464f9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/de3320b54068a9e69748aa943e582294623fd3b5/ofl/arefruqaa/ArefRuqaa-Bold.ttf?raw=true";
      name = "ArefRuqaa-Bold.ttf";
      sha256 = "247071015b7eefd63f94d6e47949c5d10294ed31bd432f809ba9a219d93f91bb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ArefRuqaa-Regular.ttf $out/share/fonts/truetype/ArefRuqaa-Regular.ttf
     install -Dm644 ArefRuqaa-Bold.ttf $out/share/fonts/truetype/ArefRuqaa-Bold.ttf
  '';

  meta = with lib; {
    description = "Aref Ruqaa";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
