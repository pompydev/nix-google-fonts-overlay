{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kulim-park-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/kulimpark/KulimPark-ExtraLight.ttf?raw=true";
      name = "KulimPark-ExtraLight.ttf";
      sha256 = "8ab13edb2e90b917f44f4f0122359fba0e28a09875409d6237b18bd58976bc5a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/kulimpark/KulimPark-ExtraLightItalic.ttf?raw=true";
      name = "KulimPark-ExtraLightItalic.ttf";
      sha256 = "4677883ce82f26b4eaf9dcd279e51c2207ea27f7a134ace76d1ae54bbfe24585";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/kulimpark/KulimPark-Light.ttf?raw=true";
      name = "KulimPark-Light.ttf";
      sha256 = "86674fee8d387fc819da5efd38725f6ba1f205e36923e5ce799fe9a608094714";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/kulimpark/KulimPark-LightItalic.ttf?raw=true";
      name = "KulimPark-LightItalic.ttf";
      sha256 = "0c4e3524b301e3cf00d471f0160108256d41f9aa92a32b5097720b7a3aa2a5e4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/kulimpark/KulimPark-Regular.ttf?raw=true";
      name = "KulimPark-Regular.ttf";
      sha256 = "29c4777b24bd07dd17fa6ffe79b8d30d859dc2b994d0d62a33cf392518404a02";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/kulimpark/KulimPark-Italic.ttf?raw=true";
      name = "KulimPark-Italic.ttf";
      sha256 = "bf29c091102f5745b206433d9c6ffded661ed63c95f35abd9e77f01db473efd8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/kulimpark/KulimPark-SemiBold.ttf?raw=true";
      name = "KulimPark-SemiBold.ttf";
      sha256 = "6f84c4ee85b5191cbef75a47510c8a0b19bb73b788b10b57261e0e9df22fe947";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/kulimpark/KulimPark-SemiBoldItalic.ttf?raw=true";
      name = "KulimPark-SemiBoldItalic.ttf";
      sha256 = "1b72bb4c7562f368ba6eacaffd72ebe215ae400c30bce7cba4e219a36df995c6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/kulimpark/KulimPark-Bold.ttf?raw=true";
      name = "KulimPark-Bold.ttf";
      sha256 = "b7b6903b9d38272eba1c63ac1c958270d5bced8493852a42107ee6fbe352a623";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/kulimpark/KulimPark-BoldItalic.ttf?raw=true";
      name = "KulimPark-BoldItalic.ttf";
      sha256 = "6d648df1c4535b1cd96f4d6d7a4d9d713e63574c4c635fa00b4f7716d18e5c1b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 KulimPark-ExtraLight.ttf $out/share/fonts/truetype/KulimPark-ExtraLight.ttf
     install -Dm644 KulimPark-ExtraLightItalic.ttf $out/share/fonts/truetype/KulimPark-ExtraLightItalic.ttf
     install -Dm644 KulimPark-Light.ttf $out/share/fonts/truetype/KulimPark-Light.ttf
     install -Dm644 KulimPark-LightItalic.ttf $out/share/fonts/truetype/KulimPark-LightItalic.ttf
     install -Dm644 KulimPark-Regular.ttf $out/share/fonts/truetype/KulimPark-Regular.ttf
     install -Dm644 KulimPark-Italic.ttf $out/share/fonts/truetype/KulimPark-Italic.ttf
     install -Dm644 KulimPark-SemiBold.ttf $out/share/fonts/truetype/KulimPark-SemiBold.ttf
     install -Dm644 KulimPark-SemiBoldItalic.ttf $out/share/fonts/truetype/KulimPark-SemiBoldItalic.ttf
     install -Dm644 KulimPark-Bold.ttf $out/share/fonts/truetype/KulimPark-Bold.ttf
     install -Dm644 KulimPark-BoldItalic.ttf $out/share/fonts/truetype/KulimPark-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Kulim Park";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
