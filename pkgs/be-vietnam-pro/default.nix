{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "be-vietnam-pro-${version}";
  version = "2022-05-23-211740";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1cfe4cb468a703a247ca2d02410f80841b496218/ofl/bevietnampro/BeVietnamPro-Thin.ttf?raw=true";
      name = "BeVietnamPro-Thin.ttf";
      sha256 = "3ff7cae0bdd4b2087fe24583d1137dc0a6ecfed96c62ee39955992fa1629176c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1cfe4cb468a703a247ca2d02410f80841b496218/ofl/bevietnampro/BeVietnamPro-ThinItalic.ttf?raw=true";
      name = "BeVietnamPro-ThinItalic.ttf";
      sha256 = "14c50e3d6c8980656681ede48068d12ae645c71b1eaa40ff14267d54a49c5c5a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1cfe4cb468a703a247ca2d02410f80841b496218/ofl/bevietnampro/BeVietnamPro-ExtraLight.ttf?raw=true";
      name = "BeVietnamPro-ExtraLight.ttf";
      sha256 = "3df1650399fd891967082bd2f78e1d87fe4eb82fc7bdbb7ab94ba8bda848caa1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1cfe4cb468a703a247ca2d02410f80841b496218/ofl/bevietnampro/BeVietnamPro-ExtraLightItalic.ttf?raw=true";
      name = "BeVietnamPro-ExtraLightItalic.ttf";
      sha256 = "fc4410f0aa39430463f103463d27be5486c2018d11854f1733dd27be7348b41c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1cfe4cb468a703a247ca2d02410f80841b496218/ofl/bevietnampro/BeVietnamPro-Light.ttf?raw=true";
      name = "BeVietnamPro-Light.ttf";
      sha256 = "f0b7143edac3fd99960312706cfa51cbafec28e7afa6d4afbd08a73bb246af13";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1cfe4cb468a703a247ca2d02410f80841b496218/ofl/bevietnampro/BeVietnamPro-LightItalic.ttf?raw=true";
      name = "BeVietnamPro-LightItalic.ttf";
      sha256 = "baeadf148ee2b6640d7910ebab99b01aaaf5eb009463bdf466ab2b43108389fd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1cfe4cb468a703a247ca2d02410f80841b496218/ofl/bevietnampro/BeVietnamPro-Regular.ttf?raw=true";
      name = "BeVietnamPro-Regular.ttf";
      sha256 = "cd1ef6e9d7db28ad5cdb88a65ccbe693870e60d340b791f349d248342b4fe4c3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1cfe4cb468a703a247ca2d02410f80841b496218/ofl/bevietnampro/BeVietnamPro-Italic.ttf?raw=true";
      name = "BeVietnamPro-Italic.ttf";
      sha256 = "a33ebb3f68e0e260a7d3874d64259ad309971a2daf969e7ce5f444d70bce535f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1cfe4cb468a703a247ca2d02410f80841b496218/ofl/bevietnampro/BeVietnamPro-Medium.ttf?raw=true";
      name = "BeVietnamPro-Medium.ttf";
      sha256 = "b60832bfa0fcd015158112c64d7e3fdad3b0c6287d1823f85a3103636e845268";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1cfe4cb468a703a247ca2d02410f80841b496218/ofl/bevietnampro/BeVietnamPro-MediumItalic.ttf?raw=true";
      name = "BeVietnamPro-MediumItalic.ttf";
      sha256 = "b7d43a5f943048f7d4e49a080052acce1902f1eab07f4160299d84abab8119fa";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1cfe4cb468a703a247ca2d02410f80841b496218/ofl/bevietnampro/BeVietnamPro-SemiBold.ttf?raw=true";
      name = "BeVietnamPro-SemiBold.ttf";
      sha256 = "bd8e27eb02720b9d91e59e4f10a90878643219f25ce6a8d9a4f06a8a88d3bb71";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1cfe4cb468a703a247ca2d02410f80841b496218/ofl/bevietnampro/BeVietnamPro-SemiBoldItalic.ttf?raw=true";
      name = "BeVietnamPro-SemiBoldItalic.ttf";
      sha256 = "f7dbf8a63f4b4a6f7d7f1f4f27443495d01475663bb8fe5cb1a6fc6740e82a27";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1cfe4cb468a703a247ca2d02410f80841b496218/ofl/bevietnampro/BeVietnamPro-Bold.ttf?raw=true";
      name = "BeVietnamPro-Bold.ttf";
      sha256 = "7f738fe5c43c8872807b20e2d30d42163618de8a4daf7f48a939adac32c16847";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1cfe4cb468a703a247ca2d02410f80841b496218/ofl/bevietnampro/BeVietnamPro-BoldItalic.ttf?raw=true";
      name = "BeVietnamPro-BoldItalic.ttf";
      sha256 = "a2a65bdf9b251beb3d658ae691889d71ce63c0290940c87ca60b449ceb0bdaee";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1cfe4cb468a703a247ca2d02410f80841b496218/ofl/bevietnampro/BeVietnamPro-ExtraBold.ttf?raw=true";
      name = "BeVietnamPro-ExtraBold.ttf";
      sha256 = "44dbfa01553d227bec76ba6446c5618870a76a4a3297f41630dde859d0650d02";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1cfe4cb468a703a247ca2d02410f80841b496218/ofl/bevietnampro/BeVietnamPro-ExtraBoldItalic.ttf?raw=true";
      name = "BeVietnamPro-ExtraBoldItalic.ttf";
      sha256 = "b5544a50b74c3153f7aa68614cfaebbea924869e6d6fdfd4ec80decfdd7ff4cd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1cfe4cb468a703a247ca2d02410f80841b496218/ofl/bevietnampro/BeVietnamPro-Black.ttf?raw=true";
      name = "BeVietnamPro-Black.ttf";
      sha256 = "dd0ec461782da7f4a58698b431a67c455ced7c09deb9c40d7b47e61975d3ffdb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1cfe4cb468a703a247ca2d02410f80841b496218/ofl/bevietnampro/BeVietnamPro-BlackItalic.ttf?raw=true";
      name = "BeVietnamPro-BlackItalic.ttf";
      sha256 = "d55266c614d1fb013a6661c5cd1d98f31f2e03418d83e90f509b210f452c0cdf";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BeVietnamPro-Thin.ttf $out/share/fonts/truetype/BeVietnamPro-Thin.ttf
     install -Dm644 BeVietnamPro-ThinItalic.ttf $out/share/fonts/truetype/BeVietnamPro-ThinItalic.ttf
     install -Dm644 BeVietnamPro-ExtraLight.ttf $out/share/fonts/truetype/BeVietnamPro-ExtraLight.ttf
     install -Dm644 BeVietnamPro-ExtraLightItalic.ttf $out/share/fonts/truetype/BeVietnamPro-ExtraLightItalic.ttf
     install -Dm644 BeVietnamPro-Light.ttf $out/share/fonts/truetype/BeVietnamPro-Light.ttf
     install -Dm644 BeVietnamPro-LightItalic.ttf $out/share/fonts/truetype/BeVietnamPro-LightItalic.ttf
     install -Dm644 BeVietnamPro-Regular.ttf $out/share/fonts/truetype/BeVietnamPro-Regular.ttf
     install -Dm644 BeVietnamPro-Italic.ttf $out/share/fonts/truetype/BeVietnamPro-Italic.ttf
     install -Dm644 BeVietnamPro-Medium.ttf $out/share/fonts/truetype/BeVietnamPro-Medium.ttf
     install -Dm644 BeVietnamPro-MediumItalic.ttf $out/share/fonts/truetype/BeVietnamPro-MediumItalic.ttf
     install -Dm644 BeVietnamPro-SemiBold.ttf $out/share/fonts/truetype/BeVietnamPro-SemiBold.ttf
     install -Dm644 BeVietnamPro-SemiBoldItalic.ttf $out/share/fonts/truetype/BeVietnamPro-SemiBoldItalic.ttf
     install -Dm644 BeVietnamPro-Bold.ttf $out/share/fonts/truetype/BeVietnamPro-Bold.ttf
     install -Dm644 BeVietnamPro-BoldItalic.ttf $out/share/fonts/truetype/BeVietnamPro-BoldItalic.ttf
     install -Dm644 BeVietnamPro-ExtraBold.ttf $out/share/fonts/truetype/BeVietnamPro-ExtraBold.ttf
     install -Dm644 BeVietnamPro-ExtraBoldItalic.ttf $out/share/fonts/truetype/BeVietnamPro-ExtraBoldItalic.ttf
     install -Dm644 BeVietnamPro-Black.ttf $out/share/fonts/truetype/BeVietnamPro-Black.ttf
     install -Dm644 BeVietnamPro-BlackItalic.ttf $out/share/fonts/truetype/BeVietnamPro-BlackItalic.ttf
  '';

  meta = with lib; {
    description = "Be Vietnam Pro";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
