{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-myanmar-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoserifmyanmar/NotoSerifMyanmar-Thin.ttf?raw=true";
      name = "NotoSerifMyanmar-Thin.ttf";
      sha256 = "91d7c3a9402a3ed18e6c087a511b7542a096801ead8669027f0dfa617f50466f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoserifmyanmar/NotoSerifMyanmar-ExtraLight.ttf?raw=true";
      name = "NotoSerifMyanmar-ExtraLight.ttf";
      sha256 = "444025fd3d29e7d8a454e632a8ecfd02468d7c5236c39c75f6ad2067ce7e6b6d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoserifmyanmar/NotoSerifMyanmar-Light.ttf?raw=true";
      name = "NotoSerifMyanmar-Light.ttf";
      sha256 = "68b4f774195520f0b6e9ba54aa6ae951eea9a9a6f6ba6a766de11eed00a570a0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoserifmyanmar/NotoSerifMyanmar-Regular.ttf?raw=true";
      name = "NotoSerifMyanmar-Regular.ttf";
      sha256 = "f88d1da5a75a8e09ff0b073fe3c861d095a72e94fea3235f09f80e6c5b2c9933";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoserifmyanmar/NotoSerifMyanmar-Medium.ttf?raw=true";
      name = "NotoSerifMyanmar-Medium.ttf";
      sha256 = "007c08a5d7554c82a6b6fc3482e897625cf867c7dc22e7f9b7ebf55c9451bb0d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoserifmyanmar/NotoSerifMyanmar-SemiBold.ttf?raw=true";
      name = "NotoSerifMyanmar-SemiBold.ttf";
      sha256 = "5c82e1c2780a8ce1bc49abee4fa5392bc39333a65acd5affff7589df934a4c90";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoserifmyanmar/NotoSerifMyanmar-Bold.ttf?raw=true";
      name = "NotoSerifMyanmar-Bold.ttf";
      sha256 = "4188186da169f55df6cba7b01b9e08c9f44516e0ad66766fc8b46e806b423a7e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoserifmyanmar/NotoSerifMyanmar-ExtraBold.ttf?raw=true";
      name = "NotoSerifMyanmar-ExtraBold.ttf";
      sha256 = "74a006beaa2d64d5204a620530c564366b316dcb443a2278039997a34978f0e0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoserifmyanmar/NotoSerifMyanmar-Black.ttf?raw=true";
      name = "NotoSerifMyanmar-Black.ttf";
      sha256 = "3bc1073eba29f4ea86d05922cae88216e0ac36170614fa5e99487ebc70bd0879";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifMyanmar-Thin.ttf $out/share/fonts/truetype/NotoSerifMyanmar-Thin.ttf
     install -Dm644 NotoSerifMyanmar-ExtraLight.ttf $out/share/fonts/truetype/NotoSerifMyanmar-ExtraLight.ttf
     install -Dm644 NotoSerifMyanmar-Light.ttf $out/share/fonts/truetype/NotoSerifMyanmar-Light.ttf
     install -Dm644 NotoSerifMyanmar-Regular.ttf $out/share/fonts/truetype/NotoSerifMyanmar-Regular.ttf
     install -Dm644 NotoSerifMyanmar-Medium.ttf $out/share/fonts/truetype/NotoSerifMyanmar-Medium.ttf
     install -Dm644 NotoSerifMyanmar-SemiBold.ttf $out/share/fonts/truetype/NotoSerifMyanmar-SemiBold.ttf
     install -Dm644 NotoSerifMyanmar-Bold.ttf $out/share/fonts/truetype/NotoSerifMyanmar-Bold.ttf
     install -Dm644 NotoSerifMyanmar-ExtraBold.ttf $out/share/fonts/truetype/NotoSerifMyanmar-ExtraBold.ttf
     install -Dm644 NotoSerifMyanmar-Black.ttf $out/share/fonts/truetype/NotoSerifMyanmar-Black.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Myanmar";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
