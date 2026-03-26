#include "pch.h"
#include "input_manager.h"
#include "core/core.h"
#include "input_forwarder.h"
#include "external_overlay.h"
#include <imgui/imgui.h>

bool InputManager::ProcessMessage(UINT uMsg, WPARAM wParam)
{
	if (uMsg == WM_KEYDOWN) 
	{
		switch (wParam)
		{
		case VK_INSERT: TriggerAction(InputAction::ToggleMenu); return true;
		case VK_F5:     TriggerAction(InputAction::ToggleCursor); return true;
		case VK_F6:     TriggerAction(InputAction::UnlockCursor); return true;
		default: break;
		}
	}
	return false;
}

void InputManager::ProcessExternal()
{
	if (InputForwarder::IsMenuTogglePressed())   TriggerAction(InputAction::ToggleMenu);
	if (InputForwarder::IsCursorTogglePressed()) TriggerAction(InputAction::ToggleCursor);
	if (InputForwarder::IsCursorUnlockPressed()) TriggerAction(InputAction::UnlockCursor);
}

void InputManager::TriggerAction(InputAction action)
{
	switch (action)
	{
	case InputAction::ToggleMenu:
	{
		auto& showMenu = Core::context->state.showMenu;
		showMenu = !showMenu;
		ImGui::GetIO().MouseDrawCursor = showMenu;
		ClipCursor(nullptr);

		if (Core::context->state.externalOverlay)
			Core::context->state.externalOverlay->SetInputCapture(showMenu);
		break;
	}
	case InputAction::ToggleCursor:
	{
		auto& showCursor = Core::context->state.showCursor;
		showCursor = !showCursor;
		showCursor ? ShowCursor(TRUE) : ShowCursor(FALSE);
		break;
	}
	case InputAction::UnlockCursor:
	{
		ClipCursor(nullptr);
		break;
	}
	}
}
