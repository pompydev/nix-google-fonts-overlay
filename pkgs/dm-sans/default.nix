{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "dm-sans-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3bac4fe063da99f0cdad2579f6d3039e6d128e37/ofl/dmsans/DMSans-Regular.ttf?raw=true";
      name = "DMSans-Regular.ttf";
      sha256 = "1adb096acaa3d14f5ed678e99b808b0c8800f62cb342fa5c276298ad8030b458";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3bac4fe063da99f0cdad2579f6d3039e6d128e37/ofl/dmsans/DMSans-Italic.ttf?raw=true";
      name = "DMSans-Italic.ttf";
      sha256 = "53992066f9370ce6738551b753e347373ff6f318ce7c9f7f59e73f99cd7996f3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3bac4fe063da99f0cdad2579f6d3039e6d128e37/ofl/dmsans/DMSans-Medium.ttf?raw=true";
      name = "DMSans-Medium.ttf";
      sha256 = "4f6a909db85e054e53cd180fe781cfe048416cdd87f7365ac2871c8d646a9033";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3bac4fe063da99f0cdad2579f6d3039e6d128e37/ofl/dmsans/DMSans-MediumItalic.ttf?raw=true";
      name = "DMSans-MediumItalic.ttf";
      sha256 = "3768622886d0984cee17b249e3340655bb864b827d9702014a160fbdd5a6b8d6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3bac4fe063da99f0cdad2579f6d3039e6d128e37/ofl/dmsans/DMSans-Bold.ttf?raw=true";
      name = "DMSans-Bold.ttf";
      sha256 = "9d801f8a966a9860a9fd2921a54362a7d7058c7821e2cafc7f75ed055884a034";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3bac4fe063da99f0cdad2579f6d3039e6d128e37/ofl/dmsans/DMSans-BoldItalic.ttf?raw=true";
      name = "DMSans-BoldItalic.ttf";
      sha256 = "3736512ae41892adcf246ba8305f14e16e2157b56436f2da4837d4824e4c0418";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DMSans-Regular.ttf $out/share/fonts/truetype/DMSans-Regular.ttf
     install -Dm644 DMSans-Italic.ttf $out/share/fonts/truetype/DMSans-Italic.ttf
     install -Dm644 DMSans-Medium.ttf $out/share/fonts/truetype/DMSans-Medium.ttf
     install -Dm644 DMSans-MediumItalic.ttf $out/share/fonts/truetype/DMSans-MediumItalic.ttf
     install -Dm644 DMSans-Bold.ttf $out/share/fonts/truetype/DMSans-Bold.ttf
     install -Dm644 DMSans-BoldItalic.ttf $out/share/fonts/truetype/DMSans-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "DM Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
