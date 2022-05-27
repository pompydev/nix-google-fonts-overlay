{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-gujarati-${version}";
  version = "2022-05-24-065742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansgujarati/NotoSansGujarati-Thin.ttf?raw=true";
      name = "NotoSansGujarati-Thin.ttf";
      sha256 = "cf844d668be168e4a15e973dedec163edbe8b11e79dc60d63b54084a885f0298";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansgujarati/NotoSansGujarati-ExtraLight.ttf?raw=true";
      name = "NotoSansGujarati-ExtraLight.ttf";
      sha256 = "e40d448f809f6f540d05631cf29be322300c2e049607cc60e0ca2b50a5c6f9cb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansgujarati/NotoSansGujarati-Light.ttf?raw=true";
      name = "NotoSansGujarati-Light.ttf";
      sha256 = "fdb4cc9adb876e902dcf0b4adb226440ff266bdd4540cc06036da3d9952be007";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansgujarati/NotoSansGujarati-Regular.ttf?raw=true";
      name = "NotoSansGujarati-Regular.ttf";
      sha256 = "4468a3a24516831874fb4a867b760a22257944584e478d32a97e3c4d4bfc6400";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansgujarati/NotoSansGujarati-Medium.ttf?raw=true";
      name = "NotoSansGujarati-Medium.ttf";
      sha256 = "17efd6fca10c5fa70dbc5a8f9f07bf860ff76ebf684c5a961768492f6aec331a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansgujarati/NotoSansGujarati-SemiBold.ttf?raw=true";
      name = "NotoSansGujarati-SemiBold.ttf";
      sha256 = "9851f3331089adfb00f708ae36d960ec77a225fd491d1226523b842210bd4fe9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansgujarati/NotoSansGujarati-Bold.ttf?raw=true";
      name = "NotoSansGujarati-Bold.ttf";
      sha256 = "db2b642c28b021da8cb0f3463bf41376549c850aa718ca863ec3ff5d5df0f2f7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansgujarati/NotoSansGujarati-ExtraBold.ttf?raw=true";
      name = "NotoSansGujarati-ExtraBold.ttf";
      sha256 = "f712956a49b9c2f184ed459572fbf1ac31b3a34389688d5e90eae3f87db79b6e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansgujarati/NotoSansGujarati-Black.ttf?raw=true";
      name = "NotoSansGujarati-Black.ttf";
      sha256 = "e6856943886ddd2f73ce872b423e96b730d5b2f7a8c931f5da0366f6c9fe399f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansGujarati-Thin.ttf $out/share/fonts/truetype/NotoSansGujarati-Thin.ttf
     install -Dm644 NotoSansGujarati-ExtraLight.ttf $out/share/fonts/truetype/NotoSansGujarati-ExtraLight.ttf
     install -Dm644 NotoSansGujarati-Light.ttf $out/share/fonts/truetype/NotoSansGujarati-Light.ttf
     install -Dm644 NotoSansGujarati-Regular.ttf $out/share/fonts/truetype/NotoSansGujarati-Regular.ttf
     install -Dm644 NotoSansGujarati-Medium.ttf $out/share/fonts/truetype/NotoSansGujarati-Medium.ttf
     install -Dm644 NotoSansGujarati-SemiBold.ttf $out/share/fonts/truetype/NotoSansGujarati-SemiBold.ttf
     install -Dm644 NotoSansGujarati-Bold.ttf $out/share/fonts/truetype/NotoSansGujarati-Bold.ttf
     install -Dm644 NotoSansGujarati-ExtraBold.ttf $out/share/fonts/truetype/NotoSansGujarati-ExtraBold.ttf
     install -Dm644 NotoSansGujarati-Black.ttf $out/share/fonts/truetype/NotoSansGujarati-Black.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Gujarati";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
