project "protobuf"
	kind "StaticLib"
    cppdialect "C++20"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"protos/**.h",
        "protos/**.cc",
	}

    removefiles
    {
        "protos/protos_internal_test.cc",
        "protos/protos_extension_lock_test.cc",
        "protos/repeated_field_iterator_test.cc",

        "protos/"
    }

	includedirs
	{
        "",
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
    cppdialect "C++17"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
        "src/**.h",
        "src/**.cc",

        "src/**.pb.h"

        -- "upb/**.h",
        -- "upb/**.cc",

        -- "upb_generator/**.h",
        -- "upb_generator/**.cc",
	}

    removefiles
    {
        "src/google/protobuf/testing/*.h",
        "src/google/protobuf/testing/*.cc",

        "src/google/protobuf/compiler/main_no_generators.cc",

        "src/google/protobuf/compiler/csharp/**.h",
        "src/google/protobuf/compiler/csharp/**.cc",
        "src/google/protobuf/compiler/java/**.h",
        "src/google/protobuf/compiler/java/**.cc",
        "src/google/protobuf/compiler/objectivec/**.h",
        "src/google/protobuf/compiler/objectivec/**.cc",
        "src/google/protobuf/compiler/php/**.h",
        "src/google/protobuf/compiler/php/**.cc",
        "src/google/protobuf/compiler/python/**.h",
        "src/google/protobuf/compiler/python/**.cc",
        "src/google/protobuf/compiler/ruby/**.h",
        "src/google/protobuf/compiler/ruby/**.cc",
        "src/google/protobuf/compiler/rust/**.h",
        "src/google/protobuf/compiler/rust/**.cc",

        "upb/**/test.cc",
        "upb/test/**.h",
        "upb/test/**.cc",
        "ubp/io/zero_copy_stream_test.cc",
        "ubp/io/tokenizer_test.cc",
        "ubp/io/string_test.cc",
        "ubp/util/def_to_proto_fuzz_test.cc",
        "ubp/wire/epc_copy_input_stream_test.cc",
        "ubp/util/compare_test.cc",
        "ubp/message/promote_test.cc",
        "ubp/mini_table/compat_test.cc",
        "ubp/message/utf8_test.cc",
        "ubp/message/copy_test.cc",
        "ubp/message/accessors_test.cc",
        "ubp/mem/arena_test.cc",
        "ubp/message/map_test.cc",
        "ubp/message/array_test.cc",
        "ubp/lex/atoi_test.cc",
        "ubp/io/string_test.cc",
        
        "src/google/protobuf/testing/**.cc",
        "src/google/protobuf/testing/**.h",
        "src/google/protobuf/any_test.cc",
        "src/google/protobuf/arenaz_sampler_test.cc",
        "src/google/protobuf/arena_align_test.cc",
        "src/google/protobuf/arena_unittest.cc",
        "src/google/protobuf/arenastring_unitest.cc",
        "src/google/protobuf/arenastring_unittest.cc",
        "src/google/protobuf/file_unitttest.cc",
        "src/google/protobuf/generator_unittest.cc",
        "src/google/protobuf/map_probe_benchmark.cc",
        "src/google/protobuf/compiler/allowlists/allowlist_test.cc",
        "src/google/protobuf/compiler/annotation_test_util.h",
        "src/google/protobuf/compiler/command_line_interface_unittest.cc",
        "src/google/protobuf/compiler/command_line_interface_tester.h",
        "src/google/protobuf/compiler/command_line_interface_tester.cc",
        "src/google/protobuf/compiler/command_line_interface_unittest.cc",
        "src/google/protobuf/compiler/importer_unittest.cc",
        "src/google/protobuf/compiler/annotation_test_util.cc",
        "src/google/protobuf/compiler/arena_test_util.h",
        "src/google/protobuf/compiler/arena_test_util.cc",
        "src/google/protobuf/compiler/code_generator_unittest.cc",
        "src/google/protobuf/compiler/descriptor_database_unittest.cc",
        "src/google/protobuf/compiler/descriptor_visitor_test.cc",
        "src/google/protobuf/compiler/drop_unknown_fields_test.cc",
        "src/google/protobuf/compiler/dynamic_message_unittest.cc",
        "src/google/protobuf/compiler/extension_set_unittest.cc",
        "src/google/protobuf/compiler/feature_resolver_test.cc",
        "src/google/protobuf/compiler/generated_enum_util_test.cc",
        "src/google/protobuf/compiler/generated_message_reflection_unittest.cc",
        "src/google/protobuf/compiler/generated_message_tctable_lite_test.cc",
        "src/google/protobuf/compiler/inlined_string_field_unittest.cc",
        "src/google/protobuf/compiler/internal_message_util_unitttest.cc",
        "src/google/protobuf/compiler/internal_visibility_for_testing.h",
        "src/google/protobuf/compiler/lite_arena_unitttest.cc",
        "src/google/protobuf/compiler/lite_unitttest.cc",
        "src/google/protobuf/compiler/map_field_test.cc",
        "src/google/protobuf/compiler/map_lite_test_util.h",
        "src/google/protobuf/compiler/map_lite_test_util.cc",
        "src/google/protobuf/compiler/message_unittest.cc",
        "src/google/protobuf/compiler/mock_code_generator.h",
        "src/google/protobuf/compiler/mock_code_generator.cc",
        "src/google/protobuf/compiler/no_field_presence_test.cc",
        "src/google/protobuf/compiler/parser_unittest.cc",
        "src/google/protobuf/compiler/proto3_arena_lite_unittest.cc",
        "src/google/protobuf/compiler/proto3_arena_unittest.cc",
        "src/google/protobuf/compiler/proto3_lite_unittest.cc",
        "src/google/protobuf/compiler/redaction_metric_test.cc",
        "src/google/protobuf/compiler/reflection_mode_test.cc",
        "src/google/protobuf/compiler/reflection_ops_unittest.cc",
        "src/google/protobuf/compiler/reflection_tester.h",
        "src/google/protobuf/compiler/reflection_tester.cc",
        "src/google/protobuf/compiler/repeated_field_reflection_unittest.cc",
        "src/google/protobuf/compiler/repeated_field_unittest.cc",
        "src/google/protobuf/compiler/retention_unittest.cc",
        "src/google/protobuf/compiler/text_format_unittest.cc",
        "src/google/protobuf/compiler/test_plugin.cc",
        "src/google/protobuf/compiler/unknown_field_set_unittest.cc",
        "src/google/protobuf/compiler/well_known_types_unittest.cc",
        "src/google/protobuf/compiler/wire_format_unittest.cc",

        "src/google/protobuf/compiler/cpp/copy_unittest.cc",
        "src/google/protobuf/compiler/cpp/arena_ctor_visibility_test.cc",
        "src/google/protobuf/compiler/cpp/bootstrap_unittest.cc",
        "src/google/protobuf/compiler/cpp/file_unittest.cc",
        "src/google/protobuf/compiler/cpp/generator_unittest.cc",
        "src/google/protobuf/compiler/cpp/message_size_unittest.cc",
        "src/google/protobuf/compiler/cpp/metadata_test.cc",
        "src/google/protobuf/compiler/cpp/move_unittest.cc",
        "src/google/protobuf/compiler/cpp/plugin_unittest.cc",
        "src/google/protobuf/compiler/cpp/unittest.h",
        "src/google/protobuf/compiler/cpp/unittest.cc",

        "src/google/protobuf/compiler/cpp/tools/*.h",
        "src/google/protobuf/compiler/cpp/tools/*.cc",
        
        "src/google/protobuf/editions/generated_reflection_test.cc",
        "src/google/protobuf/editions/defaults_test.cc",
        "src/google/protobuf/editions/generated_files_test.cc",

        "src/google/protobuf/io/coded_stream_unittest.cc",
        "src/google/protobuf/io/io_win32_unittest.cc",
        "src/google/protobuf/io/printer_death_test.cc",
        "src/google/protobuf/io/printer_unittest.cc",
        "src/google/protobuf/io/tokenizer_unittest.cc",
        "src/google/protobuf/io/test_zero_copy_stream.h",
        "src/google/protobuf/io/test_zero_copy_stream.cc",
        "src/google/protobuf/io/zero_copy_sink_test.cc",
        "src/google/protobuf/io/test_zero_copy_stream_test.cc",
        "src/google/protobuf/io/zero_copy_stream_unittest.cc",

        "src/google/protobuf/json/json_test.cc",
        "src/google/protobuf/json/internal/zero_copy_buffered_stream_test.cc",
        "src/google/protobuf/json/internal/lexer_test.cc",
        
        "src/google/protobuf/stubs/common_unittest.cc",

        "src/google/protobuf/util/delimited_message_util_test.cc",
        "src/google/protobuf/util/field_comparator_test.cc",
        "src/google/protobuf/util/field_mask_util_test.cc",
        "src/google/protobuf/util/message_differencer_unittest.cc",
        "src/google/protobuf/util/time_util_test.cc",
        "src/google/protobuf/util/type_resolver_util_test.cc",

        "src/google/protobuf/arena_test_util.h",
        "src/google/protobuf/arena_test_util.cc",
        "src/google/protobuf/descriptor_database_unittest.cc",
        "src/google/protobuf/descriptor_visitor_test.cc",
        "src/google/protobuf/descriptor_unittest.cc",
        "src/google/protobuf/dynamic_message_unittest.cc",
        "src/google/protobuf/drop_unknown_fields_test.cc",
        "src/google/protobuf/extension_set_unittest.cc",
        "src/google/protobuf/feature_resolver_test.cc",
        "src/google/protobuf/generated_enum_util_test.cc",
        "src/google/protobuf/generated_message_reflection_unittest.cc",
        "src/google/protobuf/generated_message_tctable_lite_test.cc",
        "src/google/protobuf/has_bits_test.cc",
        "src/google/protobuf/inlined_string_util_unittest.cc",
        "src/google/protobuf/inlined_string_field_unittest.cc",
        "src/google/protobuf/internal_visibility_for_testing.h",
        "src/google/protobuf/internal_message_util_unittest.cc",
        "src/google/protobuf/lite_arena_unittest.cc",
        "src/google/protobuf/lite_unittest.cc",
        "src/google/protobuf/map_field_test.cc",
        "src/google/protobuf/map_lite_test_util.h",
        "src/google/protobuf/map_lite_test_util.cc",
        "src/google/protobuf/map_test_util.h",
        "src/google/protobuf/map_test_util_impl.h",
        "src/google/protobuf/map_test.cc",
        "src/google/protobuf/message_unittest.cc",
        "src/google/protobuf/no_field_presence_test.cc",
        "src/google/protobuf/preserve_unknown_enum_test.cc",
        "src/google/protobuf/proto3_arena_lite_unittest.cc",
        "src/google/protobuf/proto3_arena_unittest.cc",
        "src/google/protobuf/proto3_lite_unittest.cc",
        "src/google/protobuf/port_test.cc",
        "src/google/protobuf/raw_ptr_test.cc",
        "src/google/protobuf/redaction_metric_test.cc",
        "src/google/protobuf/reflection_mode_test.cc",
        "src/google/protobuf/reflection_ops_unittest.cc",
        "src/google/protobuf/reflection_tester.h",
        'src/google/protobuf/reflection_tester.cc',
        "src/google/protobuf/repeated_field_reflection_unittest.cc",
        "src/google/protobuf/repeated_field_unittest.cc",
        "src/google/protobuf/retention_test.cc",
        "src/google/protobuf/string_block_test.cc",
        "src/google/protobuf/test_textproto.h",
        "src/google/protobuf/test_util.h",
        "src/google/protobuf/test_util.cc",
        "src/google/protobuf/test_util_lite.h",
        "src/google/protobuf/test_util_lite.cc",
        "src/google/protobuf/test_util2.h",
        "src/google/protobuf/test_plugin.cc",
        "src/google/protobuf/text_format_unittest.cc",
        "src/google/protobuf/unknown_field_set_unittest.cc",
        "src/google/protobuf/varint_shuffle_test.cc",
        "src/google/protobuf/well_known_types_unittest.cc",
        "src/google/protobuf/wire_format_unittest.cc",
    }

	includedirs
	{
        "",
		"src",
        "%{IncludeDir.absl}",
        "utf8_range/"
	}

	filter "system:windows"
		systemversion "latest"
		staticruntime "off"

	filter "system:linux"
		pic "on"
		systemversion "latest"
		staticruntime "off"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"