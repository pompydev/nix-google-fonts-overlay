{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-thai-looped-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8b575d598097bc969d2ad068bbb9f9e91b821a2f/ofl/notosansthailooped/NotoSansThaiLooped-Thin.ttf?raw=true";
      name = "NotoSansThaiLooped-Thin.ttf";
      sha256 = "8e3fc497daa00aac43d52fd50eb694de42c681c9ddc46101e44014eed2f7ff6e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansthailooped/NotoSansThaiLooped-ExtraLight.ttf?raw=true";
      name = "NotoSansThaiLooped-ExtraLight.ttf";
      sha256 = "4263450c032bdd4d09f9518fd09e864cd576dfdafcbea0847b59b10e14cb1e42";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansthailooped/NotoSansThaiLooped-Light.ttf?raw=true";
      name = "NotoSansThaiLooped-Light.ttf";
      sha256 = "56387c758aa6c4386fd73f91b95485c892a1cbea02b438a97e02b84110f933bf";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8b575d598097bc969d2ad068bbb9f9e91b821a2f/ofl/notosansthailooped/NotoSansThaiLooped-Regular.ttf?raw=true";
      name = "NotoSansThaiLooped-Regular.ttf";
      sha256 = "bf81f5562474060d88c5df7eacc7285a5152ed0f3941340d14148c9cca8ce9ef";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansthailooped/NotoSansThaiLooped-Medium.ttf?raw=true";
      name = "NotoSansThaiLooped-Medium.ttf";
      sha256 = "1321f3aeea320b3a38f5c52d5eab9ffe116cc6073c698859f880598955c95053";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansthailooped/NotoSansThaiLooped-SemiBold.ttf?raw=true";
      name = "NotoSansThaiLooped-SemiBold.ttf";
      sha256 = "8762f2dcee032eba28b809b5ebb1f7f97c0533022c32bf3a4d0929a8cca6bd7a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansthailooped/NotoSansThaiLooped-Bold.ttf?raw=true";
      name = "NotoSansThaiLooped-Bold.ttf";
      sha256 = "7f86c46bd96f93da736805e00741369742a8ceddead832a76418ab3f40029c1d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansthailooped/NotoSansThaiLooped-ExtraBold.ttf?raw=true";
      name = "NotoSansThaiLooped-ExtraBold.ttf";
      sha256 = "1b88f9f393dea6fa71601b9d7fbb0407773a33ca0463ed0112c898d154edaec5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8b575d598097bc969d2ad068bbb9f9e91b821a2f/ofl/notosansthailooped/NotoSansThaiLooped-Black.ttf?raw=true";
      name = "NotoSansThaiLooped-Black.ttf";
      sha256 = "4dbbe027db830bf5d229de0391721ccfdc04558047d8715f691121936ed1e91b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansThaiLooped-Thin.ttf $out/share/fonts/truetype/NotoSansThaiLooped-Thin.ttf
     install -Dm644 NotoSansThaiLooped-ExtraLight.ttf $out/share/fonts/truetype/NotoSansThaiLooped-ExtraLight.ttf
     install -Dm644 NotoSansThaiLooped-Light.ttf $out/share/fonts/truetype/NotoSansThaiLooped-Light.ttf
     install -Dm644 NotoSansThaiLooped-Regular.ttf $out/share/fonts/truetype/NotoSansThaiLooped-Regular.ttf
     install -Dm644 NotoSansThaiLooped-Medium.ttf $out/share/fonts/truetype/NotoSansThaiLooped-Medium.ttf
     install -Dm644 NotoSansThaiLooped-SemiBold.ttf $out/share/fonts/truetype/NotoSansThaiLooped-SemiBold.ttf
     install -Dm644 NotoSansThaiLooped-Bold.ttf $out/share/fonts/truetype/NotoSansThaiLooped-Bold.ttf
     install -Dm644 NotoSansThaiLooped-ExtraBold.ttf $out/share/fonts/truetype/NotoSansThaiLooped-ExtraBold.ttf
     install -Dm644 NotoSansThaiLooped-Black.ttf $out/share/fonts/truetype/NotoSansThaiLooped-Black.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Thai Looped";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
