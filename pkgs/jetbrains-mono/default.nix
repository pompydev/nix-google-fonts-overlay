{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jetbrains-mono-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2e05c1cf00a6e4f40a4b931600a90881c26e15cd/ofl/jetbrainsmono/JetBrainsMono[wght].ttf?raw=true";
      name = "JetBrainsMono[wght].ttf";
      sha256 = "48715a42ec242c21e9f02692891e147d022299a52e48d5e413e1a942193ffeda";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2e05c1cf00a6e4f40a4b931600a90881c26e15cd/ofl/jetbrainsmono/JetBrainsMono-Italic[wght].ttf?raw=true";
      name = "JetBrainsMono-Italic[wght].ttf";
      sha256 = "85ae2a5cd3f56baf1ce1c21a851322c58e3d8fbe8e8ad4a4d090a820dd7fe558";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'JetBrainsMono[wght].ttf' $out/share/fonts/truetype/'JetBrainsMono[wght].ttf'
     install -Dm644 'JetBrainsMono-Italic[wght].ttf' $out/share/fonts/truetype/'JetBrainsMono-Italic[wght].ttf'
  '';

  meta = with lib; {
    description = "JetBrains Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
