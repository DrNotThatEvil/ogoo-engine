dofile "../premake/globals.lua"

workspace "ogoo_examples_${cfg.platform}"
    location (build_root)
    configurations { "Debug", "Release" }

    dofile (orange_dir .. "orange.lua")


project "default_example"
    kind "WindowedApp"    
    language "C++"
    dependson{ "orange" }

    includedirs 
    {
        -- core
        orange_dir .. "include/",
        
        -- third party
        orangegoo_root .. "third_pary/",
        
        -- example include
        "include/",
    }

    files 
    {
        (examples_root .. "source/**.cpp"),
        (examples_root .. "include/**.h") 
    }

    location (build_root .. platform_dir .. "/examples/")
    targetdir (build_root .. "examples/" .. platform_dir .. "/bin/")
    debugdir (build_root .. "examples/" .. platform_dir .. "/bin/debug")

    configuration "Debug"
        defines { "DEBUG" }
        symbols "On"
        targetname "default_example_d"
        architecture "x64"
        links { "orange" }
        libdirs
        {
            build_root .. "lib/" .. platform_dir .. "/debug"
        }
