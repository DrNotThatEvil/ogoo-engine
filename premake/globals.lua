platform_dir = "linux"

orangegoo_root = path.getabsolute(os.getcwd() .. "/..") .. "/"
orange_dir = orangegoo_root .. "source/orange/"
goo_dir = orangegoo_root .. "source/goo/"

build_root = orangegoo_root .. "build/"
platform_build_root = build_root .. platform_dir .. "/"

examples_root = orangegoo_root .. "examples/"