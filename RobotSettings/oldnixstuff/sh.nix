{ pkgs ? import <nixpkgs> {} }: with pkgs;


  pkgs.mkShell {
    # nativeBuildInputs is usually what you want -- tools you need to run
    nativeBuildInputs = [stdenv.cc.cc.lib pam qt5.full];
    shellHook = ''
    '';
}

# not found:
# /nix/store/50msfhkz5wbyk8i78pjv3y9lxdrp7dlm-gcc-10.3.0-lib/lib/libstdc++.so.6
	# libglib-2.0.so.0 => not found
	# libGL.so.1 => not found
	# libgthread-2.0.so.0 => not found
	# libstdc++.so.6 => not found
# 
