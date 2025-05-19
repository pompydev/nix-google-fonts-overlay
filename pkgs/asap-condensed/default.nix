{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "asap-condensed-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/asapcondensed/AsapCondensed-ExtraLight.ttf?raw=true";
      name = "AsapCondensed-ExtraLight.ttf";
      sha256 = "e30503c60c1b098ae0657d1527ca596715491db012e2dff9433a61f6cfa7746a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/asapcondensed/AsapCondensed-ExtraLightItalic.ttf?raw=true";
      name = "AsapCondensed-ExtraLightItalic.ttf";
      sha256 = "978a8ea13f294dc9441d98716539a15f0fd66f35b461bb718027af5172a31f0f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/asapcondensed/AsapCondensed-Light.ttf?raw=true";
      name = "AsapCondensed-Light.ttf";
      sha256 = "5c0efec5bc4edf6ab723c7e9aee01c6a77286a47b09ec2bb2242c1301b5d3f7f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/asapcondensed/AsapCondensed-LightItalic.ttf?raw=true";
      name = "AsapCondensed-LightItalic.ttf";
      sha256 = "30359421f6a9a4e227ede14895e686c278814492ff86417411af676464ac8b00";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/asapcondensed/AsapCondensed-Regular.ttf?raw=true";
      name = "AsapCondensed-Regular.ttf";
      sha256 = "297336aba664e16c2c6aadb64a66fb31d63f048eae3d22409492cd2f1b4cdda0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/asapcondensed/AsapCondensed-Italic.ttf?raw=true";
      name = "AsapCondensed-Italic.ttf";
      sha256 = "e3d24bd65328b2906d3f076b84c7291e86799fa5e767890e7520303e71e28353";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/asapcondensed/AsapCondensed-Medium.ttf?raw=true";
      name = "AsapCondensed-Medium.ttf";
      sha256 = "91a4c8a3a3199d7553aa9b720336cf3fef50b5dbac1d11f8a53241808d72faa0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/asapcondensed/AsapCondensed-MediumItalic.ttf?raw=true";
      name = "AsapCondensed-MediumItalic.ttf";
      sha256 = "94d51f12ddd8e944ba1d138c0b9394fe10ee0295e8a1e78b131e4ff7b15d1250";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/asapcondensed/AsapCondensed-SemiBold.ttf?raw=true";
      name = "AsapCondensed-SemiBold.ttf";
      sha256 = "92d1eb2579fa9868a1c3676bdb51079d5c13469aa61a12164e25dc46c24bdbae";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/asapcondensed/AsapCondensed-SemiBoldItalic.ttf?raw=true";
      name = "AsapCondensed-SemiBoldItalic.ttf";
      sha256 = "297082b21a15095c4e63f67dcb543049a3bacab961891da82d30540074e939cb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/asapcondensed/AsapCondensed-Bold.ttf?raw=true";
      name = "AsapCondensed-Bold.ttf";
      sha256 = "0ed4b4f29a0abed3a5049270f28d8e11c797edc7c0270cc51495c0578622f82a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/asapcondensed/AsapCondensed-BoldItalic.ttf?raw=true";
      name = "AsapCondensed-BoldItalic.ttf";
      sha256 = "a67d4459760386ad033b452a1008f5f34a5b21c7b73445038589a176c00982a0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/asapcondensed/AsapCondensed-ExtraBold.ttf?raw=true";
      name = "AsapCondensed-ExtraBold.ttf";
      sha256 = "6c904a245bb9d04b0b2b1cc441c77c1d2c3710ad872cfbc37cb644cc2857e860";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/asapcondensed/AsapCondensed-ExtraBoldItalic.ttf?raw=true";
      name = "AsapCondensed-ExtraBoldItalic.ttf";
      sha256 = "75b9e39cb404a54bc660c808d3f65e7017c3e0a80b62a1e3e9f20d261561451f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/asapcondensed/AsapCondensed-Black.ttf?raw=true";
      name = "AsapCondensed-Black.ttf";
      sha256 = "30e3b2f8c5154fd754057e1a067a0e00ee67efe40e2178af16bcf244d1d0474a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/asapcondensed/AsapCondensed-BlackItalic.ttf?raw=true";
      name = "AsapCondensed-BlackItalic.ttf";
      sha256 = "e4a20e1abf15ed3d5895c5929dedd376286c85b8cbd4c9e4b18f71961a60fbb6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AsapCondensed-ExtraLight.ttf $out/share/fonts/truetype/AsapCondensed-ExtraLight.ttf
     install -Dm644 AsapCondensed-ExtraLightItalic.ttf $out/share/fonts/truetype/AsapCondensed-ExtraLightItalic.ttf
     install -Dm644 AsapCondensed-Light.ttf $out/share/fonts/truetype/AsapCondensed-Light.ttf
     install -Dm644 AsapCondensed-LightItalic.ttf $out/share/fonts/truetype/AsapCondensed-LightItalic.ttf
     install -Dm644 AsapCondensed-Regular.ttf $out/share/fonts/truetype/AsapCondensed-Regular.ttf
     install -Dm644 AsapCondensed-Italic.ttf $out/share/fonts/truetype/AsapCondensed-Italic.ttf
     install -Dm644 AsapCondensed-Medium.ttf $out/share/fonts/truetype/AsapCondensed-Medium.ttf
     install -Dm644 AsapCondensed-MediumItalic.ttf $out/share/fonts/truetype/AsapCondensed-MediumItalic.ttf
     install -Dm644 AsapCondensed-SemiBold.ttf $out/share/fonts/truetype/AsapCondensed-SemiBold.ttf
     install -Dm644 AsapCondensed-SemiBoldItalic.ttf $out/share/fonts/truetype/AsapCondensed-SemiBoldItalic.ttf
     install -Dm644 AsapCondensed-Bold.ttf $out/share/fonts/truetype/AsapCondensed-Bold.ttf
     install -Dm644 AsapCondensed-BoldItalic.ttf $out/share/fonts/truetype/AsapCondensed-BoldItalic.ttf
     install -Dm644 AsapCondensed-ExtraBold.ttf $out/share/fonts/truetype/AsapCondensed-ExtraBold.ttf
     install -Dm644 AsapCondensed-ExtraBoldItalic.ttf $out/share/fonts/truetype/AsapCondensed-ExtraBoldItalic.ttf
     install -Dm644 AsapCondensed-Black.ttf $out/share/fonts/truetype/AsapCondensed-Black.ttf
     install -Dm644 AsapCondensed-BlackItalic.ttf $out/share/fonts/truetype/AsapCondensed-BlackItalic.ttf
  '';

  meta = with lib; {
    description = "Asap Condensed";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
