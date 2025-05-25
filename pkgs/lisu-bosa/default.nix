{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lisu-bosa-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lisubosa/LisuBosa-ExtraLight.ttf?raw=true";
      name = "LisuBosa-ExtraLight.ttf";
      sha256 = "5ec9be841408c31ceeac98c616efda0052c7b6483ac210d7eea272a8984bc448";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lisubosa/LisuBosa-ExtraLightItalic.ttf?raw=true";
      name = "LisuBosa-ExtraLightItalic.ttf";
      sha256 = "fe1c6824bbe9d5166b7f6333d46a4fe0db2f682a1aa0255b9a212cec660ecdc5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lisubosa/LisuBosa-Light.ttf?raw=true";
      name = "LisuBosa-Light.ttf";
      sha256 = "e14e61301c02466818684c07bb494941b6faf4b3c9dbdbdc6eb1f5bf298a60d2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lisubosa/LisuBosa-LightItalic.ttf?raw=true";
      name = "LisuBosa-LightItalic.ttf";
      sha256 = "e3ce4065109f02b13e8dfc533e8d465faf5523825cb3aa26109afc6ad50e0374";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lisubosa/LisuBosa-Regular.ttf?raw=true";
      name = "LisuBosa-Regular.ttf";
      sha256 = "d1516e8eacbc05b95b032bff3a5c4ed0cb726ceb3db14a19085bc0c4cc2c64a4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lisubosa/LisuBosa-Italic.ttf?raw=true";
      name = "LisuBosa-Italic.ttf";
      sha256 = "266bfc2b8d2157bf6591d8620e04ef79d634a5bb47171152c9fd27d203e73586";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lisubosa/LisuBosa-Medium.ttf?raw=true";
      name = "LisuBosa-Medium.ttf";
      sha256 = "f3b0510d65b01621a4bbc02ada39adff9687a515e386c4f77c64130f3afbe1ba";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lisubosa/LisuBosa-MediumItalic.ttf?raw=true";
      name = "LisuBosa-MediumItalic.ttf";
      sha256 = "c6ffe490d9dc41df608c41596fe1809fd535c19b5c9f926eef67a5e78a214d87";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lisubosa/LisuBosa-SemiBold.ttf?raw=true";
      name = "LisuBosa-SemiBold.ttf";
      sha256 = "1c0a31ccc975e64ad42e73116ee0691d535ab124f3f83fad9289c1ff35b9593b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lisubosa/LisuBosa-SemiBoldItalic.ttf?raw=true";
      name = "LisuBosa-SemiBoldItalic.ttf";
      sha256 = "542b2300fe9519ce804b6e98d8bb4354dc4871e6f18011c39104e1754179ded5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lisubosa/LisuBosa-Bold.ttf?raw=true";
      name = "LisuBosa-Bold.ttf";
      sha256 = "f37c2557ea5be20c02f2ca1edd2bf509801f5287e5e1f139bd56716afe77b576";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lisubosa/LisuBosa-BoldItalic.ttf?raw=true";
      name = "LisuBosa-BoldItalic.ttf";
      sha256 = "1e78cb42e80ff80f88ed0c09a6b908336d30c1f67c5274e6b5bb3a3f1625a4db";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lisubosa/LisuBosa-ExtraBold.ttf?raw=true";
      name = "LisuBosa-ExtraBold.ttf";
      sha256 = "80b38481eef0901c16deb6b1aa6a5b91220f56ddf0f60498237d6df761b5386a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lisubosa/LisuBosa-ExtraBoldItalic.ttf?raw=true";
      name = "LisuBosa-ExtraBoldItalic.ttf";
      sha256 = "79394df5682593ddbdfbbf02843cbd239674961d73455976f3af8d69028ce360";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lisubosa/LisuBosa-Black.ttf?raw=true";
      name = "LisuBosa-Black.ttf";
      sha256 = "0098f180285dd4bc649e4806fc1c6d4ac8289fee83ca28e81939c3558501135d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lisubosa/LisuBosa-BlackItalic.ttf?raw=true";
      name = "LisuBosa-BlackItalic.ttf";
      sha256 = "ec30db42a6c9aa0f1e37797efccf80f23684d502d8cb78c794f851575412002e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LisuBosa-ExtraLight.ttf $out/share/fonts/truetype/LisuBosa-ExtraLight.ttf
     install -Dm644 LisuBosa-ExtraLightItalic.ttf $out/share/fonts/truetype/LisuBosa-ExtraLightItalic.ttf
     install -Dm644 LisuBosa-Light.ttf $out/share/fonts/truetype/LisuBosa-Light.ttf
     install -Dm644 LisuBosa-LightItalic.ttf $out/share/fonts/truetype/LisuBosa-LightItalic.ttf
     install -Dm644 LisuBosa-Regular.ttf $out/share/fonts/truetype/LisuBosa-Regular.ttf
     install -Dm644 LisuBosa-Italic.ttf $out/share/fonts/truetype/LisuBosa-Italic.ttf
     install -Dm644 LisuBosa-Medium.ttf $out/share/fonts/truetype/LisuBosa-Medium.ttf
     install -Dm644 LisuBosa-MediumItalic.ttf $out/share/fonts/truetype/LisuBosa-MediumItalic.ttf
     install -Dm644 LisuBosa-SemiBold.ttf $out/share/fonts/truetype/LisuBosa-SemiBold.ttf
     install -Dm644 LisuBosa-SemiBoldItalic.ttf $out/share/fonts/truetype/LisuBosa-SemiBoldItalic.ttf
     install -Dm644 LisuBosa-Bold.ttf $out/share/fonts/truetype/LisuBosa-Bold.ttf
     install -Dm644 LisuBosa-BoldItalic.ttf $out/share/fonts/truetype/LisuBosa-BoldItalic.ttf
     install -Dm644 LisuBosa-ExtraBold.ttf $out/share/fonts/truetype/LisuBosa-ExtraBold.ttf
     install -Dm644 LisuBosa-ExtraBoldItalic.ttf $out/share/fonts/truetype/LisuBosa-ExtraBoldItalic.ttf
     install -Dm644 LisuBosa-Black.ttf $out/share/fonts/truetype/LisuBosa-Black.ttf
     install -Dm644 LisuBosa-BlackItalic.ttf $out/share/fonts/truetype/LisuBosa-BlackItalic.ttf
  '';

  meta = with lib; {
    description = "Lisu Bosa";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
