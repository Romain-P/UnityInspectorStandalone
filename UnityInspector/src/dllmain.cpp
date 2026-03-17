#include "pch.h"

#include "game/core/core.h"
#include "gui/window/window.h"
#include "gui/window/window_finder.h"
#include "gui/window/external_overlay.h"
#include "gui/window/input_forwarder.h"

static void Init(HMODULE hMod)
{
    const std::vector<std::pair<dx_hook::Hk11::Mode, const char*>> hookMethods =
    {
        {dx_hook::Hk11::Mode::Discord, X("Discord")},
        {dx_hook::Hk11::Mode::Steam, X("Steam")},
        {dx_hook::Hk11::Mode::Kiero, X("Kiero")},
    };

    bool hookSuccess = false;
    const auto config = Core::config.get();
    uint8_t try_count = 0;

    while (!WindowFinder::FindGameWindow())
    {
        std::this_thread::sleep_for(2s);
        try_count++;
        if (constexpr uint8_t max_try = 15; try_count >= max_try) goto exit;
    }

	try_count = 0;

    do {
	    if (config->gameAssembly = GetModuleHandleA(X("mono-2.0-bdwgc.dll")); config->gameAssembly)
	    {
            config->gameMode = UR::Mode::Mono;
            break;
	    }
        if (config->gameAssembly = GetModuleHandleA(X("GameAssembly.dll")); config->gameAssembly)
        {
            config->gameMode = UR::Mode::Il2Cpp;
            break;
        }

        std::this_thread::sleep_for(5s);
        try_count++;

        if (constexpr uint8_t max_try = 5; try_count >= max_try) goto exit;
    } while (true);

    console::StartConsole(X("Debug Console"), true);
    LOG_INFO(X("Game Assemblies Loaded"));
    LOG_INFO(X("Initializing..."));
    UR::Init(config->gameAssembly, config->gameMode);

    LOG_INFO(X("initializing Overlay Hook."));

    for (const auto& [method, name] : hookMethods) 
    {
        if (dx_hook::Hk11::Build(Window::OnPresent, method)) 
        {
            LOG_INFO(X("Successfully initialized {} DirectX Hook."), name);
            hookSuccess = true;
            break;
        }
    }

    if (!hookSuccess)
    {
        HWND gameHwnd = nullptr;
        for (uint8_t i = 0; i < 10 && !gameHwnd; i++) 
        {
            gameHwnd = WindowFinder::FindGameWindow();
            if (!gameHwnd) std::this_thread::sleep_for(500ms);
        }

        if (!gameHwnd) {
            LOG_ERROR(X("Failed to find game window for external overlay!"));
            goto exit;
        }

        LOG_INFO(X("Found game window: {}"), reinterpret_cast<uint64_t>(gameHwnd));

        const auto externalOverlay = std::make_unique<ExternalOverlay>();
        if (!externalOverlay->Create(gameHwnd)) 
        {
            LOG_ERROR(X("Failed to create external overlay!"));
            goto exit;
        }

        config->externalOverlay = externalOverlay.get();
        InputForwarder::Initialize(externalOverlay->GetOverlayHwnd(), gameHwnd);
        externalOverlay->SetInputCapture(config->ShowImGui);

        LOG_INFO(X("External overlay initialized successfully."));
        externalOverlay->RunRenderLoop();

        config->externalOverlay = nullptr;
        InputForwarder::Shutdown();
        externalOverlay->Destroy();
        LOG_INFO(X("External overlay shut down."));
    }
    else 
    {
        dx_hook::Hk11::SetWndProc(Window::MyWndProc);
    }

    return;

exit:
    LOG_INFO(X("Exiting..."));
    std::this_thread::sleep_for(3s);
    console::EndConsole();
    ExitThread(1);
}

BOOL APIENTRY DllMain(HMODULE hMod, DWORD reason, LPVOID lpReserved)
{
    if (reason == DLL_PROCESS_ATTACH)
    {
        DisableThreadLibraryCalls(hMod);
		CreateThread(nullptr, 0, reinterpret_cast<LPTHREAD_START_ROUTINE>(Init), hMod, 0, nullptr);
    }
    return TRUE;
}
