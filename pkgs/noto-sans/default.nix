{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a970ecbe0bf1e6ae5cb22d6abdea672448655f0c/ofl/notosans/NotoSans-Thin.ttf?raw=true";
      name = "NotoSans-Thin.ttf";
      sha256 = "9163391f6f7cf916454720e33bfd7977ba4950ea5c4cd07753cbdbc77dce2dc9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a970ecbe0bf1e6ae5cb22d6abdea672448655f0c/ofl/notosans/NotoSans-ThinItalic.ttf?raw=true";
      name = "NotoSans-ThinItalic.ttf";
      sha256 = "433be8f9b08f789d015928a3b9976f08c0bdf64fb9346bc3d4168dd3d7683f92";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a970ecbe0bf1e6ae5cb22d6abdea672448655f0c/ofl/notosans/NotoSans-ExtraLight.ttf?raw=true";
      name = "NotoSans-ExtraLight.ttf";
      sha256 = "b40c9cd01d3cd218e05bd2ebc4154bed0b1c37de2de9f969a96aaf50b0b1337e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a970ecbe0bf1e6ae5cb22d6abdea672448655f0c/ofl/notosans/NotoSans-ExtraLightItalic.ttf?raw=true";
      name = "NotoSans-ExtraLightItalic.ttf";
      sha256 = "bbdc5a6b6246c1386247dd568992c7a1a6eb85d18424f08cf8f698948c7cc56b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a970ecbe0bf1e6ae5cb22d6abdea672448655f0c/ofl/notosans/NotoSans-Light.ttf?raw=true";
      name = "NotoSans-Light.ttf";
      sha256 = "90463deb8a6046325e274567e17aa3c2159b12e039033933b03560399b5e3587";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a970ecbe0bf1e6ae5cb22d6abdea672448655f0c/ofl/notosans/NotoSans-LightItalic.ttf?raw=true";
      name = "NotoSans-LightItalic.ttf";
      sha256 = "ef54ae6e2b62b2174674298c7e2ec75a9e33c10edcfea65e30b8bb928f821bbf";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a970ecbe0bf1e6ae5cb22d6abdea672448655f0c/ofl/notosans/NotoSans-Regular.ttf?raw=true";
      name = "NotoSans-Regular.ttf";
      sha256 = "a3c4b14201354e76f360300cccf688162280b90ea1639092f1e76706a040fab4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a970ecbe0bf1e6ae5cb22d6abdea672448655f0c/ofl/notosans/NotoSans-Italic.ttf?raw=true";
      name = "NotoSans-Italic.ttf";
      sha256 = "6c0681558d11213df5f979cb677f63acec40a774497ee9bee048c53eb485574c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a970ecbe0bf1e6ae5cb22d6abdea672448655f0c/ofl/notosans/NotoSans-Medium.ttf?raw=true";
      name = "NotoSans-Medium.ttf";
      sha256 = "a3d6b7d1dec34b2de0490af6fd24625a976f2b4a788edda1a7e48343c5fcf79d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a970ecbe0bf1e6ae5cb22d6abdea672448655f0c/ofl/notosans/NotoSans-MediumItalic.ttf?raw=true";
      name = "NotoSans-MediumItalic.ttf";
      sha256 = "2687121b5187892dbddf8d8ccc2bd5f232c802001b4e19eb2db9ecc307a5fc4e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a970ecbe0bf1e6ae5cb22d6abdea672448655f0c/ofl/notosans/NotoSans-SemiBold.ttf?raw=true";
      name = "NotoSans-SemiBold.ttf";
      sha256 = "202130b0a3e389590735c5ce08339dc4b0cafc195322929b2383a011e5fd20d0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a970ecbe0bf1e6ae5cb22d6abdea672448655f0c/ofl/notosans/NotoSans-SemiBoldItalic.ttf?raw=true";
      name = "NotoSans-SemiBoldItalic.ttf";
      sha256 = "35ad22d67ecacb557b34e5d0e99d8f2f4da51a3453806e66d9a0899caac733a9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a970ecbe0bf1e6ae5cb22d6abdea672448655f0c/ofl/notosans/NotoSans-Bold.ttf?raw=true";
      name = "NotoSans-Bold.ttf";
      sha256 = "0d73b5b230cffac4cba183571bfdd52c3f4dfc49cfc1b5447db99d53d2b47111";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a970ecbe0bf1e6ae5cb22d6abdea672448655f0c/ofl/notosans/NotoSans-BoldItalic.ttf?raw=true";
      name = "NotoSans-BoldItalic.ttf";
      sha256 = "4b08c127ed0399da6913d938f8e3f45a5d87f197b636f3d2978c6515f0cebd86";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a970ecbe0bf1e6ae5cb22d6abdea672448655f0c/ofl/notosans/NotoSans-ExtraBold.ttf?raw=true";
      name = "NotoSans-ExtraBold.ttf";
      sha256 = "d07dcd976086eb4c9df035ba07d68bd9fbf4a74b8cee9dc9f5b7abf70de53327";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a970ecbe0bf1e6ae5cb22d6abdea672448655f0c/ofl/notosans/NotoSans-ExtraBoldItalic.ttf?raw=true";
      name = "NotoSans-ExtraBoldItalic.ttf";
      sha256 = "de41405732859a95b5da651bbb865bd0d5f4ba4b98b463e82077901c43c8c427";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a970ecbe0bf1e6ae5cb22d6abdea672448655f0c/ofl/notosans/NotoSans-Black.ttf?raw=true";
      name = "NotoSans-Black.ttf";
      sha256 = "44df728c403bcf52c1d705378986923d4b72985e45daec8475497d4f8622fe64";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a970ecbe0bf1e6ae5cb22d6abdea672448655f0c/ofl/notosans/NotoSans-BlackItalic.ttf?raw=true";
      name = "NotoSans-BlackItalic.ttf";
      sha256 = "ce2a3ca85621e6d2578c54d2c37ed386748c4590fb078c88ac41ba8447502d9c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSans-Thin.ttf $out/share/fonts/truetype/NotoSans-Thin.ttf
     install -Dm644 NotoSans-ThinItalic.ttf $out/share/fonts/truetype/NotoSans-ThinItalic.ttf
     install -Dm644 NotoSans-ExtraLight.ttf $out/share/fonts/truetype/NotoSans-ExtraLight.ttf
     install -Dm644 NotoSans-ExtraLightItalic.ttf $out/share/fonts/truetype/NotoSans-ExtraLightItalic.ttf
     install -Dm644 NotoSans-Light.ttf $out/share/fonts/truetype/NotoSans-Light.ttf
     install -Dm644 NotoSans-LightItalic.ttf $out/share/fonts/truetype/NotoSans-LightItalic.ttf
     install -Dm644 NotoSans-Regular.ttf $out/share/fonts/truetype/NotoSans-Regular.ttf
     install -Dm644 NotoSans-Italic.ttf $out/share/fonts/truetype/NotoSans-Italic.ttf
     install -Dm644 NotoSans-Medium.ttf $out/share/fonts/truetype/NotoSans-Medium.ttf
     install -Dm644 NotoSans-MediumItalic.ttf $out/share/fonts/truetype/NotoSans-MediumItalic.ttf
     install -Dm644 NotoSans-SemiBold.ttf $out/share/fonts/truetype/NotoSans-SemiBold.ttf
     install -Dm644 NotoSans-SemiBoldItalic.ttf $out/share/fonts/truetype/NotoSans-SemiBoldItalic.ttf
     install -Dm644 NotoSans-Bold.ttf $out/share/fonts/truetype/NotoSans-Bold.ttf
     install -Dm644 NotoSans-BoldItalic.ttf $out/share/fonts/truetype/NotoSans-BoldItalic.ttf
     install -Dm644 NotoSans-ExtraBold.ttf $out/share/fonts/truetype/NotoSans-ExtraBold.ttf
     install -Dm644 NotoSans-ExtraBoldItalic.ttf $out/share/fonts/truetype/NotoSans-ExtraBoldItalic.ttf
     install -Dm644 NotoSans-Black.ttf $out/share/fonts/truetype/NotoSans-Black.ttf
     install -Dm644 NotoSans-BlackItalic.ttf $out/share/fonts/truetype/NotoSans-BlackItalic.ttf
  '';

  meta = with lib; {
    description = "Noto Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
