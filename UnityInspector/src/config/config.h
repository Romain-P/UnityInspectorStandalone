#pragma once
#include "pch.h"

struct RuntimeState
{
	bool showMenu = true;
	bool showCursor = false;
	HMODULE gameHandle = nullptr;
	UR::Mode unityMode;
};

struct UserSettings
{
	struct INISettings
	{
		uint32_t appid = 0;
		bool debug_console = false;
		bool avoid_quiting = false;
		bool internal_overlay = true;
		bool external_overlay = false;
	} ini;

	struct InspectorSettings
	{
		bool enabled = false;
		bool autoUpdateObject = false;
		bool autoRefresh = false;
		bool showAssemblyExplorer = false;
		bool showDebugConsole = false;
	} inspector;

	inline void Load() noexcept
	{
		char buffer[MAX_PATH];
		GetModuleFileNameA(nullptr, buffer, MAX_PATH);
		const auto configPath = std::filesystem::path(buffer).parent_path() / "config.ini";

		if (!std::filesystem::exists(configPath)) return;

		ini::IniFile configFile;
		configFile.load(configPath.string());

		if (configFile.contains("Config"))
		{
			auto& c = configFile["Config"];
			if (c.contains("debug_console"))    ini.debug_console = c["debug_console"].as<bool>();
			if (c.contains("avoid_quiting"))     ini.avoid_quiting = c["avoid_quiting"].as<bool>();
			if (c.contains("internal_overlay"))  ini.internal_overlay = c["internal_overlay"].as<bool>();
			if (c.contains("external_overlay"))  ini.external_overlay = c["external_overlay"].as<bool>();
		}
	}
};

namespace Config
{
	inline UserSettings settings;
	inline RuntimeState state;
}