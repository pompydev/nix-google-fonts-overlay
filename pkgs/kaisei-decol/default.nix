{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kaisei-decol-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/kaiseidecol/KaiseiDecol-Regular.ttf?raw=true";
      name = "KaiseiDecol-Regular.ttf";
      sha256 = "fb9202b97944fa00b5f145ad4701def5c306bcd0d26407917baef9e01b042056";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/kaiseidecol/KaiseiDecol-Medium.ttf?raw=true";
      name = "KaiseiDecol-Medium.ttf";
      sha256 = "6db5273d6807f4f575222a70ebf3bb548173dcdda2f22d9bf272d6d0e7161aa1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/kaiseidecol/KaiseiDecol-Bold.ttf?raw=true";
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
