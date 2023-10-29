project "protobuf"
	kind "StaticLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"protos/**.h",
        "protos/**.c",
	}

	includedirs
	{
		"%{IncludeDir.absl}",
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++20"
		staticruntime "off"

	filter "system:linux"
		pic "on"
		systemversion "latest"
		cppdialect "C++20"
		staticruntime "off"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

project "protoc"
	kind "ConsoleApp"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"/protos_generator/*.h",
        "/protos_generator/*.cc",

        "/upb/**.h",
        "/upb/**.cc",

        "/upb_generator/**.h",
        "/upb_generator/**.cc",
	}

    removefiles
    {
        "/test/**.h",
        "/test/**.cc",
        "/upb/**/test.cc",
        "/upb/test/**.h",
        "/upb/test/**.cc",

        "/ubp/io/zero_copy_stream_test.cc",
        "/ubp/io/tokenizer_test.cc",
        "/ubp/io/string_test.cc",
        "/ubp/util/def_to_proto_fuzz_test.cc",
        "/ubp/wire/epc_copy_input_stream_test.cc",
        "/ubp/util/compare_test.cc",
        "/ubp/message/promote_test.cc",
        "/ubp/mini_table/compat_test.cc",
        "/ubp/message/utf8_test.cc",
        "/ubp/message/copy_test.cc",
        "/ubp/message/accessors_test.cc",
        "/ubp/mem/arena_test.cc",
        "/ubp/message/map_test.cc",
        "/ubp/message/array_test.cc",
        "/ubp/lex/atoi_test.cc",
        "/ubp/io/string_test.cc",
    }

	includedirs
	{
        "",
		"/src",
        "%{IncludeDir.absl}",
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++20"
		staticruntime "off"

	filter "system:linux"
		pic "on"
		systemversion "latest"
		cppdialect "C++20"
		staticruntime "off"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"