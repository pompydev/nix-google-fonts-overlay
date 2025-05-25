{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-color-emoji-compat-test-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notocoloremojicompattest/NotoColorEmojiCompatTest-Regular.ttf?raw=true";
      name = "NotoColorEmojiCompatTest-Regular.ttf";
      sha256 = "6e549759a4476fb250b0f787fd84689f8edeef15eebc8779d5ce5159534db6cb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoColorEmojiCompatTest-Regular.ttf $out/share/fonts/truetype/NotoColorEmojiCompatTest-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Color Emoji Compat Test";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
