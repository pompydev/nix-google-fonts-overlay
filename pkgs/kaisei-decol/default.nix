{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kaisei-decol-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2cf929ff0bb4428b0cb43920004d1e1127706b4d/ofl/kaiseidecol/KaiseiDecol-Regular.ttf?raw=true";
      name = "KaiseiDecol-Regular.ttf";
      sha256 = "fb9202b97944fa00b5f145ad4701def5c306bcd0d26407917baef9e01b042056";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2cf929ff0bb4428b0cb43920004d1e1127706b4d/ofl/kaiseidecol/KaiseiDecol-Medium.ttf?raw=true";
      name = "KaiseiDecol-Medium.ttf";
      sha256 = "6db5273d6807f4f575222a70ebf3bb548173dcdda2f22d9bf272d6d0e7161aa1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2cf929ff0bb4428b0cb43920004d1e1127706b4d/ofl/kaiseidecol/KaiseiDecol-Bold.ttf?raw=true";
      name = "KaiseiDecol-Bold.ttf";
      sha256 = "0e3a6da5145fdbba32cfb1c806812d95457506e1698f5d61e8f834fb847f0d6f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 KaiseiDecol-Regular.ttf $out/share/fonts/truetype/KaiseiDecol-Regular.ttf
     install -Dm644 KaiseiDecol-Medium.ttf $out/share/fonts/truetype/KaiseiDecol-Medium.ttf
     install -Dm644 KaiseiDecol-Bold.ttf $out/share/fonts/truetype/KaiseiDecol-Bold.ttf
  '';

  meta = with lib; {
    description = "Kaisei Decol";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
