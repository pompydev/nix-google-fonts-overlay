{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "dai-banna-sil-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/daibannasil/DaiBannaSIL-Light.ttf?raw=true";
      name = "DaiBannaSIL-Light.ttf";
      sha256 = "a33a115cb803e1b2f500e48750e68a4513a965ce5248415dd2654a3b3ed24b8b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/daibannasil/DaiBannaSIL-LightItalic.ttf?raw=true";
      name = "DaiBannaSIL-LightItalic.ttf";
      sha256 = "091460bd9b0585e94b1b20d5906e6554ec29958e8e573682d37fb7c735f0860b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/daibannasil/DaiBannaSIL-Regular.ttf?raw=true";
      name = "DaiBannaSIL-Regular.ttf";
      sha256 = "7756d1c25925ba89130aef675d2d11f419602564c1091e9520fef1ac9ed8f193";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/daibannasil/DaiBannaSIL-Italic.ttf?raw=true";
      name = "DaiBannaSIL-Italic.ttf";
      sha256 = "058fb915b7a5a42ee719760406c65c036b82b55470da3f263de4131289f187af";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/daibannasil/DaiBannaSIL-Medium.ttf?raw=true";
      name = "DaiBannaSIL-Medium.ttf";
      sha256 = "cf34bb5312df3531a999a83ec4d1c0daa83a1e37a144be3d40510c06efeb4de6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/daibannasil/DaiBannaSIL-MediumItalic.ttf?raw=true";
      name = "DaiBannaSIL-MediumItalic.ttf";
      sha256 = "f0ef8fc8c85b4a1e0c9aa780b5765a5951ac4aa4820f61b5c645fd3044279887";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/daibannasil/DaiBannaSIL-SemiBold.ttf?raw=true";
      name = "DaiBannaSIL-SemiBold.ttf";
      sha256 = "49e0e792d6b0bb625569a49b320dc5f974ca96f02314a8238e5ea98d40cdcc62";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/daibannasil/DaiBannaSIL-SemiBoldItalic.ttf?raw=true";
      name = "DaiBannaSIL-SemiBoldItalic.ttf";
      sha256 = "416bc32287b4d07e8536639f35fc58e5190c4281fb6d115cd76d9ebfdddff020";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/daibannasil/DaiBannaSIL-Bold.ttf?raw=true";
      name = "DaiBannaSIL-Bold.ttf";
      sha256 = "ae562489672abdccbbcf664f29e706c114b41c110edea3fe404a9ea7c8322b55";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/daibannasil/DaiBannaSIL-BoldItalic.ttf?raw=true";
      name = "DaiBannaSIL-BoldItalic.ttf";
      sha256 = "001b197160209b8e70302c8e9aeb8504d1a2f17a830b486b20696c1ed9b6e864";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DaiBannaSIL-Light.ttf $out/share/fonts/truetype/DaiBannaSIL-Light.ttf
     install -Dm644 DaiBannaSIL-LightItalic.ttf $out/share/fonts/truetype/DaiBannaSIL-LightItalic.ttf
     install -Dm644 DaiBannaSIL-Regular.ttf $out/share/fonts/truetype/DaiBannaSIL-Regular.ttf
     install -Dm644 DaiBannaSIL-Italic.ttf $out/share/fonts/truetype/DaiBannaSIL-Italic.ttf
     install -Dm644 DaiBannaSIL-Medium.ttf $out/share/fonts/truetype/DaiBannaSIL-Medium.ttf
     install -Dm644 DaiBannaSIL-MediumItalic.ttf $out/share/fonts/truetype/DaiBannaSIL-MediumItalic.ttf
     install -Dm644 DaiBannaSIL-SemiBold.ttf $out/share/fonts/truetype/DaiBannaSIL-SemiBold.ttf
     install -Dm644 DaiBannaSIL-SemiBoldItalic.ttf $out/share/fonts/truetype/DaiBannaSIL-SemiBoldItalic.ttf
     install -Dm644 DaiBannaSIL-Bold.ttf $out/share/fonts/truetype/DaiBannaSIL-Bold.ttf
     install -Dm644 DaiBannaSIL-BoldItalic.ttf $out/share/fonts/truetype/DaiBannaSIL-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Dai Banna SIL";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
