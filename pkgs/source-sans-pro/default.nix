{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "source-sans-pro-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f3f3d547cd8c4f7963bcd4dc1965ba564b281ef7/ofl/sourcesanspro/SourceSansPro-ExtraLight.ttf?raw=true";
      name = "SourceSansPro-ExtraLight.ttf";
      sha256 = "7a44c30e92eda0963633377ff584dd83505f56e65e6c118c5ca327190db42dcd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f3f3d547cd8c4f7963bcd4dc1965ba564b281ef7/ofl/sourcesanspro/SourceSansPro-ExtraLightItalic.ttf?raw=true";
      name = "SourceSansPro-ExtraLightItalic.ttf";
      sha256 = "609d64c048f49ffc52b5f1d6f4cd2f3f87840c0639b3564adaf2e47097a01ef3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f3f3d547cd8c4f7963bcd4dc1965ba564b281ef7/ofl/sourcesanspro/SourceSansPro-Light.ttf?raw=true";
      name = "SourceSansPro-Light.ttf";
      sha256 = "719319e7fe1ed06a6bc5e66a1cfea8c52250eefee502d175780cf4571ddc5bf0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f3f3d547cd8c4f7963bcd4dc1965ba564b281ef7/ofl/sourcesanspro/SourceSansPro-LightItalic.ttf?raw=true";
      name = "SourceSansPro-LightItalic.ttf";
      sha256 = "605425dc687ecc7bdce9329c0fc976ea38eb38a910c24144ced60d73f35e855e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f3f3d547cd8c4f7963bcd4dc1965ba564b281ef7/ofl/sourcesanspro/SourceSansPro-Regular.ttf?raw=true";
      name = "SourceSansPro-Regular.ttf";
      sha256 = "3d2e962599d4bd83b797ab813f2017f2c7f7e7e0e2e8e3a497f4e713a0b3c9c9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f3f3d547cd8c4f7963bcd4dc1965ba564b281ef7/ofl/sourcesanspro/SourceSansPro-Italic.ttf?raw=true";
      name = "SourceSansPro-Italic.ttf";
      sha256 = "740798947aa0151c6bec4508ba73eb7cb22f9ef2e4354314fc638f66eaa2f072";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f3f3d547cd8c4f7963bcd4dc1965ba564b281ef7/ofl/sourcesanspro/SourceSansPro-SemiBold.ttf?raw=true";
      name = "SourceSansPro-SemiBold.ttf";
      sha256 = "37bb472f47d33a04f5616c6e9120723ed944c31306838ecd692feb7c69084da2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f3f3d547cd8c4f7963bcd4dc1965ba564b281ef7/ofl/sourcesanspro/SourceSansPro-SemiBoldItalic.ttf?raw=true";
      name = "SourceSansPro-SemiBoldItalic.ttf";
      sha256 = "8e1136c1c135261a389118f9758d477d3582c9dda10fec6b7511e27e866adfbc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f3f3d547cd8c4f7963bcd4dc1965ba564b281ef7/ofl/sourcesanspro/SourceSansPro-Bold.ttf?raw=true";
      name = "SourceSansPro-Bold.ttf";
      sha256 = "e1ac971e7b62b2ad0b0bb9f55bc15f6215df8af5bf69e894905341cfdfa51aea";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f3f3d547cd8c4f7963bcd4dc1965ba564b281ef7/ofl/sourcesanspro/SourceSansPro-BoldItalic.ttf?raw=true";
      name = "SourceSansPro-BoldItalic.ttf";
      sha256 = "0ad42cce23ed61aada9e6a156bfa411fd03354067711e04b3bb3c8470f82d8c6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f3f3d547cd8c4f7963bcd4dc1965ba564b281ef7/ofl/sourcesanspro/SourceSansPro-Black.ttf?raw=true";
      name = "SourceSansPro-Black.ttf";
      sha256 = "51fb02911c19199d2b0b35789ef52b0179380e7294abaac93855bfd1b0b1b704";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f3f3d547cd8c4f7963bcd4dc1965ba564b281ef7/ofl/sourcesanspro/SourceSansPro-BlackItalic.ttf?raw=true";
      name = "SourceSansPro-BlackItalic.ttf";
      sha256 = "0de64da2f8b859920cb60e8ea617274b9f1c9dba427773be61307d79c982204a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SourceSansPro-ExtraLight.ttf $out/share/fonts/truetype/SourceSansPro-ExtraLight.ttf
     install -Dm644 SourceSansPro-ExtraLightItalic.ttf $out/share/fonts/truetype/SourceSansPro-ExtraLightItalic.ttf
     install -Dm644 SourceSansPro-Light.ttf $out/share/fonts/truetype/SourceSansPro-Light.ttf
     install -Dm644 SourceSansPro-LightItalic.ttf $out/share/fonts/truetype/SourceSansPro-LightItalic.ttf
     install -Dm644 SourceSansPro-Regular.ttf $out/share/fonts/truetype/SourceSansPro-Regular.ttf
     install -Dm644 SourceSansPro-Italic.ttf $out/share/fonts/truetype/SourceSansPro-Italic.ttf
     install -Dm644 SourceSansPro-SemiBold.ttf $out/share/fonts/truetype/SourceSansPro-SemiBold.ttf
     install -Dm644 SourceSansPro-SemiBoldItalic.ttf $out/share/fonts/truetype/SourceSansPro-SemiBoldItalic.ttf
     install -Dm644 SourceSansPro-Bold.ttf $out/share/fonts/truetype/SourceSansPro-Bold.ttf
     install -Dm644 SourceSansPro-BoldItalic.ttf $out/share/fonts/truetype/SourceSansPro-BoldItalic.ttf
     install -Dm644 SourceSansPro-Black.ttf $out/share/fonts/truetype/SourceSansPro-Black.ttf
     install -Dm644 SourceSansPro-BlackItalic.ttf $out/share/fonts/truetype/SourceSansPro-BlackItalic.ttf
  '';

  meta = with lib; {
    description = "Source Sans Pro";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
