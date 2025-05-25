{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ibm-plex-mono-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/ibmplexmono/IBMPlexMono-Thin.ttf?raw=true";
      name = "IBMPlexMono-Thin.ttf";
      sha256 = "c44c820c14b4f1b818344e5f5dc189cee98b1d5e56b4e80055496c228f3cc7ea";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/ibmplexmono/IBMPlexMono-ThinItalic.ttf?raw=true";
      name = "IBMPlexMono-ThinItalic.ttf";
      sha256 = "3782f01f12b444c62be712676646c552fc23443e8fd02d5b5619c6c4b975516d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/ibmplexmono/IBMPlexMono-ExtraLight.ttf?raw=true";
      name = "IBMPlexMono-ExtraLight.ttf";
      sha256 = "826b765bd5173b97d521053330a66277edc224f8cc5f1e0035df1d995d5f003c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/ibmplexmono/IBMPlexMono-ExtraLightItalic.ttf?raw=true";
      name = "IBMPlexMono-ExtraLightItalic.ttf";
      sha256 = "8ae22766094bd04c2808a3c9dec812dcf061786c26ebd25eea211ae685eb2c39";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/ibmplexmono/IBMPlexMono-Light.ttf?raw=true";
      name = "IBMPlexMono-Light.ttf";
      sha256 = "780bcf65509d72a35ec114b57bcbe220dc6b77d8ea2e9b25e294be3c570c5025";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/ibmplexmono/IBMPlexMono-LightItalic.ttf?raw=true";
      name = "IBMPlexMono-LightItalic.ttf";
      sha256 = "2bb4dd18abb03cb8a0a1ae69a0a10b194e02027b817c7b13126ef4724a7f5c73";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/ibmplexmono/IBMPlexMono-Regular.ttf?raw=true";
      name = "IBMPlexMono-Regular.ttf";
      sha256 = "6a3412f058c7d8dfd9170c41e85ade48e5156ecb89356110ca57a0a27734af46";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/ibmplexmono/IBMPlexMono-Italic.ttf?raw=true";
      name = "IBMPlexMono-Italic.ttf";
      sha256 = "3362fc791b0652193328b862c1c5f23a789bc7288b1617fa63302f88689a2a34";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/ibmplexmono/IBMPlexMono-Medium.ttf?raw=true";
      name = "IBMPlexMono-Medium.ttf";
      sha256 = "a9b4c49bb299e05b5f6c481e7fb5e78943d2793249a0c8874ab574a2d1ea6755";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/ibmplexmono/IBMPlexMono-MediumItalic.ttf?raw=true";
      name = "IBMPlexMono-MediumItalic.ttf";
      sha256 = "de6e0f805a15a2a1538be5d1074741298a07ffcba6fa1f4cd93983ff73155a7d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/ibmplexmono/IBMPlexMono-SemiBold.ttf?raw=true";
      name = "IBMPlexMono-SemiBold.ttf";
      sha256 = "d3c38e55c78f5b0f28009fddba4834ec503278936a5986032424c9bd2d23aa46";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/ibmplexmono/IBMPlexMono-SemiBoldItalic.ttf?raw=true";
      name = "IBMPlexMono-SemiBoldItalic.ttf";
      sha256 = "391ef0e273eb52571eccaab6a6dbddeec48e1d282cb7bf153043512b797ed6f0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/ibmplexmono/IBMPlexMono-Bold.ttf?raw=true";
      name = "IBMPlexMono-Bold.ttf";
      sha256 = "ac27abd6450a64dd94467580a02fe6235156d5b92f2926ebbc8e7489df64e0be";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/ibmplexmono/IBMPlexMono-BoldItalic.ttf?raw=true";
      name = "IBMPlexMono-BoldItalic.ttf";
      sha256 = "af4e05a761e98c1adf064c48a6352c9bec1a6ad70982cd2a544149323391f98e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 IBMPlexMono-Thin.ttf $out/share/fonts/truetype/IBMPlexMono-Thin.ttf
     install -Dm644 IBMPlexMono-ThinItalic.ttf $out/share/fonts/truetype/IBMPlexMono-ThinItalic.ttf
     install -Dm644 IBMPlexMono-ExtraLight.ttf $out/share/fonts/truetype/IBMPlexMono-ExtraLight.ttf
     install -Dm644 IBMPlexMono-ExtraLightItalic.ttf $out/share/fonts/truetype/IBMPlexMono-ExtraLightItalic.ttf
     install -Dm644 IBMPlexMono-Light.ttf $out/share/fonts/truetype/IBMPlexMono-Light.ttf
     install -Dm644 IBMPlexMono-LightItalic.ttf $out/share/fonts/truetype/IBMPlexMono-LightItalic.ttf
     install -Dm644 IBMPlexMono-Regular.ttf $out/share/fonts/truetype/IBMPlexMono-Regular.ttf
     install -Dm644 IBMPlexMono-Italic.ttf $out/share/fonts/truetype/IBMPlexMono-Italic.ttf
     install -Dm644 IBMPlexMono-Medium.ttf $out/share/fonts/truetype/IBMPlexMono-Medium.ttf
     install -Dm644 IBMPlexMono-MediumItalic.ttf $out/share/fonts/truetype/IBMPlexMono-MediumItalic.ttf
     install -Dm644 IBMPlexMono-SemiBold.ttf $out/share/fonts/truetype/IBMPlexMono-SemiBold.ttf
     install -Dm644 IBMPlexMono-SemiBoldItalic.ttf $out/share/fonts/truetype/IBMPlexMono-SemiBoldItalic.ttf
     install -Dm644 IBMPlexMono-Bold.ttf $out/share/fonts/truetype/IBMPlexMono-Bold.ttf
     install -Dm644 IBMPlexMono-BoldItalic.ttf $out/share/fonts/truetype/IBMPlexMono-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "IBM Plex Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
