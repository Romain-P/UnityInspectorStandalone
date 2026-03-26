#pragma once
#include "pch.h"

enum class InputAction
{
	ToggleMenu,
	ToggleCursor,
	UnlockCursor
};

class InputManager
{
public:
	static bool ProcessMessage(UINT uMsg, WPARAM wParam);
	static void ProcessExternal();

private:
	static void TriggerAction(InputAction action);
};
