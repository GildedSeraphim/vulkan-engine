{
    description = "Vulkan Dev Flake";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    };

    outputs = { self, nixpkgs }@inputs:
    let
        lib = nixpkgs.lib;
        pkgs = import inputs.nixpkgs {
            system = "x86_64-linux";
        };
    in 
        {
        devShells.x86_64-linux.default = pkgs.mkShell rec {
            name = "Test Env";
            nativeBuildInputs = with pkgs;[
                
            ];

            buildInputs = with pkgs;[
		libxkbcommon
		libGL

		wayland

		SDL2
		SDL2_ttf

		boost		
                cmake
                catch2
                glm
                gcc
        
                pkg-config

                xorg.libX11
                xorg.libXrandr
                xorg.libXcursor
                xorg.libXi
                xorg.libXxf86vm

                cargo

                glfw3
                mesa
                glslang
                renderdoc
                spirv-tools
                vulkan-volk
                vulkan-tools
                vulkan-loader
                vulkan-headers
                vulkan-validation-layers
                vulkan-tools-lunarg
                vulkan-extension-layer
            ];

            packages = with pkgs; [
                
            ];

            shellHook = with pkgs; ''
                echo "Welcome to my Vulkan Shell"
                echo "vulkan loader: ${vulkan-loader}"
                echo "vulkan headers: $vulkan-headers}"
                echo "validation layer: ${vulkan-validation-layers}"
                echo "tools: ${vulkan-tools}"
                echo "tools-lunarg: ${vulkan-tools-lunarg}"
                echo "extension-layer: ${vulkan-extension-layer}"
            '';

            LD_LIBRARY_PATH = "${lib.makeLibraryPath buildInputs}";
            VK_LAYER_PATH = "${pkgs.vulkan-validation-layers}/share/vulkan/explicit_layer.d";
            VULKAN_SDK = "/home/sn/Vulkan/1.3.290.0/x86_64";
            #VK_INSTANCE_LAYERS = "
            XDG_DATA_DIRS = builtins.getEnv "XDG_DATA_DIRS";
            XDG_RUNTIME_DIR = "/run/user/1000";
        };
    };
}
