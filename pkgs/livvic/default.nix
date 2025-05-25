{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "livvic-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/livvic/Livvic-Thin.ttf?raw=true";
      name = "Livvic-Thin.ttf";
      sha256 = "17e22e7713967bebd783b1b8745649a2fc54e9ee096d8ad38129f53b47c94aef";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/livvic/Livvic-ThinItalic.ttf?raw=true";
      name = "Livvic-ThinItalic.ttf";
      sha256 = "4ecbdca3573200a38f92b3964f9f5159660969100e2e07b0b96f4414288c462c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/livvic/Livvic-ExtraLight.ttf?raw=true";
      name = "Livvic-ExtraLight.ttf";
      sha256 = "7a69d3faedade4b4ee238069fe703163842f2230b505057563882cec659c59c6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/livvic/Livvic-ExtraLightItalic.ttf?raw=true";
      name = "Livvic-ExtraLightItalic.ttf";
      sha256 = "a4b62b2c66972bc3faf72a7f635085d69eb0e73fe6c595a2574a2ac8b8d2fd67";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/livvic/Livvic-Light.ttf?raw=true";
      name = "Livvic-Light.ttf";
      sha256 = "f3baaa33ac50be741765cf91e70d84835ede9a68dc95a35740de9affde113461";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/livvic/Livvic-LightItalic.ttf?raw=true";
      name = "Livvic-LightItalic.ttf";
      sha256 = "cb15d9db1b29cd88277ecbdc77761730e3922e2e7c23b5dae04e00ab0c3b64c4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/livvic/Livvic-Regular.ttf?raw=true";
      name = "Livvic-Regular.ttf";
      sha256 = "778e7577cf8ed8f0a97eb657bbf4d4f05bc0c6e8eb0ac8458f25a0eaa6ca16e8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/livvic/Livvic-Italic.ttf?raw=true";
      name = "Livvic-Italic.ttf";
      sha256 = "a252ed6488d89f4200b54174c002846424aa5bab454220e6c68f6ab4ad03bbce";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/livvic/Livvic-Medium.ttf?raw=true";
      name = "Livvic-Medium.ttf";
      sha256 = "78f9277de8b8734cf172288fb44f359c85f3a38a6f98f2333f8e103ce1acdcf4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/livvic/Livvic-MediumItalic.ttf?raw=true";
      name = "Livvic-MediumItalic.ttf";
      sha256 = "2293e97ef4e012dc74a7a453d3261112de4b50b8b6507f8587ebc95e489490b9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/livvic/Livvic-SemiBold.ttf?raw=true";
      name = "Livvic-SemiBold.ttf";
      sha256 = "93cf062cf28cfff0359f38dd93a75f46dcf5ba514483bb557069a89b7b3c4e0c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/livvic/Livvic-SemiBoldItalic.ttf?raw=true";
      name = "Livvic-SemiBoldItalic.ttf";
      sha256 = "84a8af5c40ee96f0e9873b8e33a9d65c3a08cc3bdb5b0cd4e83e8174d12bade0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/livvic/Livvic-Bold.ttf?raw=true";
      name = "Livvic-Bold.ttf";
      sha256 = "f2e3a5952c0fe465778a2eb93a8a4fd1f27fb6a9f8080f9aa2c7f085212dcf3f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/livvic/Livvic-BoldItalic.ttf?raw=true";
      name = "Livvic-BoldItalic.ttf";
      sha256 = "b0fdf70102675ee1ac81cc38a0f0e40694a6403a8ba326cc62e99be0bad4cedd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/livvic/Livvic-Black.ttf?raw=true";
      name = "Livvic-Black.ttf";
      sha256 = "69522e784a487191945fa9f9d92d67e64cd5a4bc6e849ae42d5f4a799a8d9b60";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/livvic/Livvic-BlackItalic.ttf?raw=true";
      name = "Livvic-BlackItalic.ttf";
      sha256 = "83e66c050786059aeabeb5fb69defab2593df93caedde11746dc6277fbf8e523";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Livvic-Thin.ttf $out/share/fonts/truetype/Livvic-Thin.ttf
     install -Dm644 Livvic-ThinItalic.ttf $out/share/fonts/truetype/Livvic-ThinItalic.ttf
     install -Dm644 Livvic-ExtraLight.ttf $out/share/fonts/truetype/Livvic-ExtraLight.ttf
     install -Dm644 Livvic-ExtraLightItalic.ttf $out/share/fonts/truetype/Livvic-ExtraLightItalic.ttf
     install -Dm644 Livvic-Light.ttf $out/share/fonts/truetype/Livvic-Light.ttf
     install -Dm644 Livvic-LightItalic.ttf $out/share/fonts/truetype/Livvic-LightItalic.ttf
     install -Dm644 Livvic-Regular.ttf $out/share/fonts/truetype/Livvic-Regular.ttf
     install -Dm644 Livvic-Italic.ttf $out/share/fonts/truetype/Livvic-Italic.ttf
     install -Dm644 Livvic-Medium.ttf $out/share/fonts/truetype/Livvic-Medium.ttf
     install -Dm644 Livvic-MediumItalic.ttf $out/share/fonts/truetype/Livvic-MediumItalic.ttf
     install -Dm644 Livvic-SemiBold.ttf $out/share/fonts/truetype/Livvic-SemiBold.ttf
     install -Dm644 Livvic-SemiBoldItalic.ttf $out/share/fonts/truetype/Livvic-SemiBoldItalic.ttf
     install -Dm644 Livvic-Bold.ttf $out/share/fonts/truetype/Livvic-Bold.ttf
     install -Dm644 Livvic-BoldItalic.ttf $out/share/fonts/truetype/Livvic-BoldItalic.ttf
     install -Dm644 Livvic-Black.ttf $out/share/fonts/truetype/Livvic-Black.ttf
     install -Dm644 Livvic-BlackItalic.ttf $out/share/fonts/truetype/Livvic-BlackItalic.ttf
  '';

  meta = with lib; {
    description = "Livvic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
