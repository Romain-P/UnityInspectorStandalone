---@meta
-- UnityInspector Lua API Stubs
-- Add this file to your VSCode workspace for IntelliSense/autocomplete
-- This is a stub file - it doesn't execute, it just provides type hints

---@class Vector2
---@field x number
---@field y number
---@field Distance fun(self: Vector2, other: Vector2): number
---@overload fun(): Vector2
---@overload fun(x: number, y: number): Vector2
Vector2 = {}

---@class Vector3
---@field x number
---@field y number
---@field z number
---@field Length fun(self: Vector3): number
---@field Dot fun(self: Vector3, other: Vector3): number
---@field Normalize fun(self: Vector3): Vector3
---@field Distance fun(self: Vector3, other: Vector3): number
---@overload fun(): Vector3
---@overload fun(x: number, y: number, z: number): Vector3
Vector3 = {}

---@class Vector4
---@field x number
---@field y number
---@field z number
---@field w number
---@overload fun(): Vector4
---@overload fun(x: number, y: number, z: number, w: number): Vector4
Vector4 = {}

---@class Quaternion
---@field x number
---@field y number
---@field z number
---@field w number
---@field Euler fun(x: number, y: number, z: number): Quaternion
---@field ToEuler fun(self: Quaternion): Vector3
---@field LookRotation fun(forward: Vector3): Quaternion
---@overload fun(): Quaternion
---@overload fun(x: number, y: number, z: number, w: number): Quaternion
Quaternion = {}

---@class Color
---@field r number
---@field g number
---@field b number
---@field a number
---@overload fun(): Color
---@overload fun(r: number, g: number, b: number): Color
---@overload fun(r: number, g: number, b: number, a: number): Color
Color = {}

---@class Ray
---@field origin Vector3
---@field direction Vector3
Ray = {}

--- Factory functions (use these instead of constructors)
---@param x number
---@param y number
---@return Vector2
function MakeVector2(x, y) end

---@param x number
---@param y number
---@param z number
---@return Vector3
function MakeVector3(x, y, z) end

---@param x number
---@param y number
---@param z number
---@param w number
---@return Vector4
function MakeVector4(x, y, z, w) end

---@param x number
---@param y number
---@param z number
---@param w number
---@return Quaternion
function MakeQuaternion(x, y, z, w) end

---@param r number
---@param g number
---@param b number
---@param a? number
---@return Color
function MakeColor(r, g, b, a) end

---@param origin Vector3
---@param dir Vector3
---@return Ray
function MakeRay(origin, dir) end

---@class UnityObject
---@field GetName fun(self: UnityObject): string
---@field Destroy fun(self: UnityObject)
---@field DontDestroyOnLoad fun(self: UnityObject)
UnityObject = {}

---@class GameObject : UnityObject
---@field SetActive fun(self: GameObject, active: boolean)
---@field GetActiveSelf fun(self: GameObject): boolean
---@field GetActiveInHierarchy fun(self: GameObject): boolean
---@field GetTag fun(self: GameObject): string
---@field GetTransform fun(self: GameObject): Transform
GameObject = {}

---@class Component : UnityObject
---@field GetTransform fun(self: Component): Transform
---@field GetGameObject fun(self: Component): GameObject
---@field GetTag fun(self: Component): string
Component = {}

---@class Transform : Component
---@field GetPosition fun(self: Transform): Vector3
---@field SetPosition fun(self: Transform, pos: Vector3)
---@field GetRotation fun(self: Transform): Quaternion
---@field SetRotation fun(self: Transform, q: Quaternion)
---@field GetLocalPosition fun(self: Transform): Vector3
---@field SetLocalPosition fun(self: Transform, pos: Vector3)
---@field GetLocalRotation fun(self: Transform): Quaternion
---@field SetLocalRotation fun(self: Transform, q: Quaternion)
---@field GetLocalScale fun(self: Transform): Vector3
---@field SetLocalScale fun(self: Transform, s: Vector3)
---@field GetForward fun(self: Transform): Vector3
---@field GetRight fun(self: Transform): Vector3
---@field GetUp fun(self: Transform): Vector3
---@field GetChildCount fun(self: Transform): number
---@field GetChild fun(self: Transform, index: number): Transform
---@field GetParent fun(self: Transform): Transform
---@field GetRoot fun(self: Transform): Transform
---@field GetGameObject fun(self: Transform): GameObject
Transform = {}

---@class Camera : Component
---@field GetDepth fun(self: Camera): number
---@field SetDepth fun(self: Camera, depth: number)
---@field GetFoV fun(self: Camera): number
---@field SetFoV fun(self: Camera, fov: number)
---@field WorldToScreenPoint fun(self: Camera, pos: Vector3): Vector3
---@field ScreenToWorldPoint fun(self: Camera, pos: Vector3): Vector3
---@field ScreenPointToRay fun(self: Camera, pos: Vector2): Ray
Camera = {}

---@class Light : Component
---@field GetIntensity fun(self: Light): number
---@field SetIntensity fun(self: Light, v: number)
---@field GetColor fun(self: Light): Color
---@field SetColor fun(self: Light, c: Color)
---@field GetRange fun(self: Light): number
---@field SetRange fun(self: Light, v: number)
Light = {}

---@class Rigidbody : Component
---@field GetVelocity fun(self: Rigidbody): Vector3
---@field SetVelocity fun(self: Rigidbody, v: Vector3)
---@field GetDetectCollisions fun(self: Rigidbody): boolean
---@field SetDetectCollisions fun(self: Rigidbody, v: boolean)
Rigidbody = {}

---@class Class
---@field name string
---@field namespaze string
---@field parent string
---@field FindObjectsOfType fun(self: Class): table<number, Component>
---@field FindObjectsByType fun(self: Class): table<number, Component>
---@field New fun(self: Class): userdata
---@field GetFieldValue fun(self: Class, obj: userdata, fieldName: string): any
---@field SetFieldValue fun(self: Class, obj: userdata, fieldName: string, value: any)
---@field InvokeMethod fun(self: Class, obj: userdata, methodName: string, ...): any
Class = {}

---@class Assembly
---@field name string
---@field file string
Assembly = {}

---@class DrawList
---@field AddLine fun(self: DrawList, a: Vector2, b: Vector2, col: number, thickness?: number)
---@field AddRect fun(self: DrawList, a: Vector2, b: Vector2, col: number, rounding?: number, flags?: number, thickness?: number)
---@field AddRectFilled fun(self: DrawList, a: Vector2, b: Vector2, col: number, rounding?: number, flags?: number)
---@field AddCircle fun(self: DrawList, center: Vector2, radius: number, col: number, segments?: number, thickness?: number)
---@field AddCircleFilled fun(self: DrawList, center: Vector2, radius: number, col: number, segments?: number)
---@field AddText fun(self: DrawList, pos: Vector2, col: number, text: string)
---@field AddTriangle fun(self: DrawList, a: Vector2, b: Vector2, c: Vector2, col: number, thickness?: number)
---@field AddTriangleFilled fun(self: DrawList, a: Vector2, b: Vector2, c: Vector2, col: number)
---@field PushClipRect fun(self: DrawList, a: Vector2, b: Vector2, intersect: boolean)
---@field PopClipRect fun(self: DrawList)
DrawList = {}

---@class Unity
Unity = {}

---@class UnityGameObject
---@field Find fun(name: string): GameObject
---@field FindGameObjectsWithTag fun(tag: string): table<number, GameObject>
---@field Create fun(name: string): GameObject
Unity.GameObject = {}

---@class UnityCamera
---@field GetMain fun(): Camera
---@field GetCurrent fun(): Camera
---@field GetAllCamera fun(): table<number, Camera>
Unity.Camera = {}

---@class UnityLight
---@field FindAll fun(): table<number, Light>
Unity.Light = {}

---@class UnityObject_NS
---@field FindObjectsOfType fun(className: string): table<number, userdata>
---@field FindObjectsByType fun(className: string): table<number, userdata>
---@field Instantiate fun(original: UnityObject): UnityObject
---@field Destroy fun(obj: UnityObject)
Unity.Object = {}

---@class UnityPhysics
---@field Raycast fun(origin: Vector3, direction: Vector3, maxDistance: number): boolean
---@field Linecast fun(start: Vector3, end_pos: Vector3): boolean
Unity.Physics = {}

---@class UnityTime
---@field GetTime fun(): number
---@field GetDeltaTime fun(): number
---@field GetFixedDeltaTime fun(): number
---@field GetTimeScale fun(): number
---@field SetTimeScale fun(v: number)
Unity.Time = {}

---@class UnityScreen
---@field GetWidth fun(): number
---@field GetHeight fun(): number
Unity.Screen = {}

---@class UnityInput
---@field GetKey fun(key: number): boolean
---@field GetKeyDown fun(key: number): boolean
---@field GetMouseButton fun(button: number): boolean
---@field GetMouseButtonDown fun(button: number): boolean
---@field GetMousePos fun(): Vector2
---@field GetMouseDelta fun(): Vector2
---@field GetMouseWheel fun(): number
Unity.Input = {}

---@class UnityResolve
---@field GetClass fun(assembly: string, className: string, namespaze: string): Class
---@field GetAssemblies fun(): table<number, Assembly>
Unity.Resolve = {}

---@class imgui
imgui = {}

---@param name string
---@param open? boolean
---@param flags? number
function imgui.Begin(name, open, flags) end

function imgui.End() end

---@param text string
function imgui.Text(text) end

---@param col Color
---@param text string
function imgui.TextColored(col, text) end

---@param label string
---@param size? Vector2
---@return boolean
function imgui.Button(label, size) end

---@param label string
---@return boolean
function imgui.SmallButton(label) end

---@param label string
---@param v boolean
---@return boolean
function imgui.Checkbox(label, v) end

---@param label string
---@param v number
---@param min number
---@param max number
---@return number
function imgui.SliderFloat(label, v, min, max) end

---@param label string
---@param v number
---@param min number
---@param max number
---@return number
function imgui.SliderInt(label, v, min, max) end

---@param label string
---@param text string
---@param flags? number
---@return string
function imgui.InputText(label, text, flags) end

---@param label string
---@param v number
---@return number
function imgui.InputFloat(label, v) end

---@param label string
---@param v Vector3
---@return Vector3
function imgui.InputFloat3(label, v) end

function imgui.Separator() end
function imgui.Spacing() end

---@param offset? number
function imgui.SameLine(offset) end

---@param size Vector2
---@param cond? number
function imgui.SetNextWindowSize(size, cond) end

---@param pos Vector2
---@param cond? number
function imgui.SetNextWindowPos(pos, cond) end

---@param key number
---@return boolean
function imgui.IsKeyDown(key) end

---@param button number
---@return boolean
function imgui.IsMouseDown(button) end

---@return Vector2
function imgui.GetMousePos() end

---@return DrawList
function imgui.GetBackgroundDrawList() end

---@return DrawList
function imgui.GetForegroundDrawList() end

---@class log
log = {}

---@param msg string
function log.info(msg) end

---@param msg string
function log.warn(msg) end

---@param msg string
function log.error(msg) end

---@param msg string
function log.debug(msg) end

---@param ... any
function print(...) end

-- Common callback functions for plugins
---@param dt number Delta time in seconds
function onUpdate(dt) end

function onInit() end
function onRender() end
function onUnload() end

-- Additional ImGui functions
---@param label string
---@param currentItem number
---@param items string Semicolon-separated items (e.g., "A;B;C")
---@return number
function imgui.Combo(label, currentItem, items) end

---@param label string
---@param currentItem number
---@param items table<number, string>
---@return number
function imgui.ListBox(label, currentItem, items) end

---@param label string
---@param v number
---@param v_speed number
---@param v_min number
---@param v_max number
---@return number
function imgui.DragFloat(label, v, v_speed, v_min, v_max) end

---@param label string
---@param v number
---@param v_speed number
---@param v_min number
---@param v_max number
---@return number
function imgui.DragInt(label, v, v_speed, v_min, v_max) end

---@param label string
---@param c Color
---@return Color
function imgui.ColorEdit3(label, c) end

---@param label string
---@param c Color
---@return Color
function imgui.ColorEdit4(label, c) end

---@param label string
---@param selected boolean
---@return boolean
function imgui.Selectable(label, selected) end

---@param label string
---@param active boolean
---@return boolean
function imgui.RadioButton(label, active) end

---@return DrawList
function imgui.GetWindowDrawList() end

---@param idx number
---@param col Color
function imgui.PushStyleColor(idx, col) end

---@param count number
function imgui.PopStyleColor(count) end

---@param idx number
---@param val number
function imgui.PushStyleVar(idx, val) end

---@param count number
function imgui.PopStyleVar(count) end

---@return Vector2
function imgui.GetWindowSize() end

---@return Vector2
function imgui.GetWindowPos() end

---@return Vector2
function imgui.GetContentRegionAvail() end

---@return number
function imgui.GetFrameHeight() end

---@return number
function imgui.GetFrameHeightWithSpacing() end

---@return boolean
function imgui.IsItemHovered() end

---@param mouseButton number
---@return boolean
function imgui.IsItemClicked(mouseButton) end

---@param text string
function imgui.SetTooltip(text) end

function imgui.BeginTooltip() end
function imgui.EndTooltip() end

---@param id string
---@param size Vector2
---@param border boolean
---@param flags number
function imgui.BeginChild(id, size, border, flags) end

function imgui.EndChild() end

---@param label string
---@param open boolean
---@return boolean
function imgui.CollapsingHeader(label, open) end

---@param label string
---@return boolean
function imgui.TreeNode(label) end

function imgui.TreePop() end
function imgui.Indent() end
function imgui.Unindent() end

---@param text string
function imgui.BulletText(text) end

---@param count number
---@param id string
---@param border boolean
function imgui.Columns(count, id, border) end

function imgui.NextColumn() end

---@param index number
---@param width number
function imgui.SetColumnWidth(index, width) end
