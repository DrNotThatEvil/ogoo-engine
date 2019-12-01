project "orange"
    kind "StaticLib"
    language "C++"
    
    includedirs
    {
        orange_dir .. "include",

        -- third party 
        orangegoo_root .. "third_party/",
    }

    files 
    {
        orange_dir .. "source/**.cpp",
        orange_dir .. "source/" .. platform_dir .."/**.cpp",

        orange_dir .. "include/**.h",
    }

    location (build_root .. platform_dir .. "/orange")

    configuration "Debug"
        defines { "DEBUG" }
        symbols "On"
        targetname "orange"
        architecture "x64"
        targetdir (build_root .. "lib/" .. platform_dir .. "/debug")
        links { "wayland-client", "wayland-egl", "EGL" }
    