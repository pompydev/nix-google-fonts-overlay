{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "wix-madefor-text-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/wixmadefortext/WixMadeforText%5Bwght%5D.ttf?raw=true";
      name = "WixMadeforText_wght_.ttf";
      sha256 = "7660fbcd33f643a011283d9e96b3ad571a942d25d1a9603e69e9e1b6976fa4e1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/wixmadefortext/WixMadeforText-Italic%5Bwght%5D.ttf?raw=true";
      name = "WixMadeforText-Italic_wght_.ttf";
      sha256 = "8c4383ad0ffc560016ad2ecfe16cbf8051e464fbfc4ecbba41d787c551875f97";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/wixmadefortext/WixMadeforText-Regular.ttf?raw=true";
      name = "WixMadeforText-Regular.ttf";
      sha256 = "dee56f09fd3efc127c1ea95557edc74110c1460a46287da36e0af25efd341ef5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/wixmadefortext/WixMadeforText-Italic.ttf?raw=true";
      name = "WixMadeforText-Italic.ttf";
      sha256 = "947fa931d687c9dc698f01851a847f061726183812ac32518642cd97805e9f05";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/wixmadefortext/WixMadeforText-Medium.ttf?raw=true";
      name = "WixMadeforText-Medium.ttf";
      sha256 = "4ecf270136af928612c76fe4ebade91d8156975e5ea4c0cf9225501dd1788e02";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/wixmadefortext/WixMadeforText-MediumItalic.ttf?raw=true";
      name = "WixMadeforText-MediumItalic.ttf";
      sha256 = "d0470c2e7e7a39b94c55834caf2d258f3cc07f66c721f11cadc00c58b6a10982";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/wixmadefortext/WixMadeforText-SemiBold.ttf?raw=true";
      name = "WixMadeforText-SemiBold.ttf";
      sha256 = "dced97a77624bc5f8b1ae65850360908297f4588e09feb6f22792d29dc7e765b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/wixmadefortext/WixMadeforText-SemiBoldItalic.ttf?raw=true";
      name = "WixMadeforText-SemiBoldItalic.ttf";
      sha256 = "603527f1cc2c871a9c8ec273bf32d364a8a8ac2839296aa7b70b1cd8c77d61c0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/wixmadefortext/WixMadeforText-Bold.ttf?raw=true";
      name = "WixMadeforText-Bold.ttf";
      sha256 = "37c179b4fefb63ea9637322b84583a2df53aa226c150294eea1675c14b1b8e29";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/wixmadefortext/WixMadeforText-BoldItalic.ttf?raw=true";
      name = "WixMadeforText-BoldItalic.ttf";
      sha256 = "81a32794a42384039d6a8ef05871700d2f1e41f31c4be25f1e226535c419e514";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/wixmadefortext/WixMadeforText-ExtraBold.ttf?raw=true";
      name = "WixMadeforText-ExtraBold.ttf";
      sha256 = "62e2fe4718129f36ecdb0ae4de385bd6b81ecc876146447167c6c140fad699a9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/wixmadefortext/WixMadeforText-ExtraBoldItalic.ttf?raw=true";
      name = "WixMadeforText-ExtraBoldItalic.ttf";
      sha256 = "d8d2b7db3762ff85b89cee1427d57e95ff91659bc5b8b63c1fca8aefaee44057";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 WixMadeforText_wght_.ttf $out/share/fonts/truetype/WixMadeforText_wght_.ttf
     install -Dm644 WixMadeforText-Italic_wght_.ttf $out/share/fonts/truetype/WixMadeforText-Italic_wght_.ttf
     install -Dm644 WixMadeforText-Regular.ttf $out/share/fonts/truetype/WixMadeforText-Regular.ttf
     install -Dm644 WixMadeforText-Italic.ttf $out/share/fonts/truetype/WixMadeforText-Italic.ttf
     install -Dm644 WixMadeforText-Medium.ttf $out/share/fonts/truetype/WixMadeforText-Medium.ttf
     install -Dm644 WixMadeforText-MediumItalic.ttf $out/share/fonts/truetype/WixMadeforText-MediumItalic.ttf
     install -Dm644 WixMadeforText-SemiBold.ttf $out/share/fonts/truetype/WixMadeforText-SemiBold.ttf
     install -Dm644 WixMadeforText-SemiBoldItalic.ttf $out/share/fonts/truetype/WixMadeforText-SemiBoldItalic.ttf
     install -Dm644 WixMadeforText-Bold.ttf $out/share/fonts/truetype/WixMadeforText-Bold.ttf
     install -Dm644 WixMadeforText-BoldItalic.ttf $out/share/fonts/truetype/WixMadeforText-BoldItalic.ttf
     install -Dm644 WixMadeforText-ExtraBold.ttf $out/share/fonts/truetype/WixMadeforText-ExtraBold.ttf
     install -Dm644 WixMadeforText-ExtraBoldItalic.ttf $out/share/fonts/truetype/WixMadeforText-ExtraBoldItalic.ttf
  '';

  meta = with lib; {
    description = "Wix Madefor Text";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
