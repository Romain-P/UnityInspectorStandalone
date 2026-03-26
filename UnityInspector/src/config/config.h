#pragma once
#include "pch.h"

struct ExternalOverlay;

struct RuntimeState
{
	bool showMenu = true;
	bool showCursor = false;
	HMODULE gameHandle = nullptr;
	UR::Mode unityMode;
	ExternalOverlay* externalOverlay = nullptr;
};

struct InspectorSettings
{
	bool enabled = false;
	bool autoUpdateObject = false;
	bool autoRefresh = false;
	bool showAssemblyExplorer = false;
	bool showDebugConsole = false;
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

	InspectorSettings inspector;

	inline void Load() noexcept
	{
		char buffer[MAX_PATH];
		GetModuleFileNameA(nullptr, buffer, MAX_PATH);
		auto configPath = std::filesystem::path(buffer).parent_path() / X("config.ini");

		if (!std::filesystem::exists(configPath)) return;

		ini::IniFile configFile;
		configFile.load(configPath.string());

		if (configFile.count(X("Config")))
		{
			auto& c = configFile[X("Config")];
			if (c.count(X("appid")))             ini.appid = c[X("appid")].as<uint32_t>();
			if (c.count(X("debug_console")))     ini.debug_console = c[X("debug_console")].as<bool>();
			if (c.count(X("avoid_quiting")))     ini.avoid_quiting = c[X("avoid_quiting")].as<bool>();
			if (c.count(X("internal_overlay")))  ini.internal_overlay = c[X("internal_overlay")].as<bool>();
			if (c.count(X("external_overlay")))  ini.external_overlay = c[X("external_overlay")].as<bool>();
		}
	}
};

struct AppContext
{
	UserSettings settings;
	RuntimeState state;
};