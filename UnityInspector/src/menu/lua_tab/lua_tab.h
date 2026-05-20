#pragma once
#include "menu/menu.h"

class LuaConsoleTab final : public ITab
{
public:
	std::string GetName() const override { return name; }
	void Render() override;

private:
	std::string name = "Lua";
};
