{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-oriya-${version}";
  version = "2022-05-24-075352";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansoriya/NotoSansOriya-Thin.ttf?raw=true";
      name = "NotoSansOriya-Thin.ttf";
      sha256 = "96c1f4fe8d821f405bad550cb460078de1141b82f81da564322a67f5f46361e3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansoriya/NotoSansOriya-Regular.ttf?raw=true";
      name = "NotoSansOriya-Regular.ttf";
      sha256 = "20751837a8cac9d0e610ffdf91c43d3391e2b267ca2cad07f6e3866798436369";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansoriya/NotoSansOriya-Bold.ttf?raw=true";
      name = "NotoSansOriya-Bold.ttf";
      sha256 = "d563e031a325aa1d5fa7975a7fed3f34409b3ef10036f75d275653e7e4bad5c2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansoriya/NotoSansOriya-Black.ttf?raw=true";
      name = "NotoSansOriya-Black.ttf";
      sha256 = "169e5cce3413f6c353b1cc47edc9f14baa605f63bbe9717b8bae258f304a8895";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansOriya-Thin.ttf $out/share/fonts/truetype/NotoSansOriya-Thin.ttf
     install -Dm644 NotoSansOriya-Regular.ttf $out/share/fonts/truetype/NotoSansOriya-Regular.ttf
     install -Dm644 NotoSansOriya-Bold.ttf $out/share/fonts/truetype/NotoSansOriya-Bold.ttf
     install -Dm644 NotoSansOriya-Black.ttf $out/share/fonts/truetype/NotoSansOriya-Black.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Oriya";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
