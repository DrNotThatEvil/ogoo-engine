workspace "ogoo"
    configurations { "Debug", "Release" }
    location ("../../build")

local function setup_linux()
    files
    {
        "source/posix/**.cpp"
    }
end

project "ogoolib"
    kind "StaticLib"    
    language "C++"

    setup_linux()

    files
    {
        "include/*.h",
        "source/*.cpp",

        "include/%{cfg.platform}/**.h",
        "source/%{cfg.platform}/**.cpp",
    }

    includedirs 
    {
        "include",

        "include/%{cfg.platform}", 
        
        "../../third_party", 
        "../../third_party/libstem_gamepad/source"
    }

    configuration "Debug"
        defines { "DEBUG" }
        entrypoint "WinMainCRTStartup"
        symbols "On"
        targetdir ("lib/%{cfg.platform}/debug")
        targetname "ogoo"
        architecture "x64"
