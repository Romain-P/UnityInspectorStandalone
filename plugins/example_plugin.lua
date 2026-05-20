-- Example UnityInspector Lua Plugin
-- Place this file in the game's /plugins/ folder next to the exe

function onInit()
    log.info("ExamplePlugin loaded!")
end

function onUpdate(dt)

end

function onRender()
    -- Draw a simple ImGui window
    imgui.Begin("Lua Plugin Window")
    imgui.Text("Hello from Lua!")
    
    local cam = Unity.Camera.GetMain()
    if cam then
        local fov = cam:GetFoV()
        imgui.Text(string.format("Camera FOV: %.1f", fov))
    end
    
    imgui.End()
end

function onUnload()
    log.info("ExamplePlugin unloaded!")
end
