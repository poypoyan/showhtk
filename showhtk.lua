-- This Source Code Form is subject to the terms of the
-- Mozilla Public License, v. 2.0. If a copy of the MPL
-- was not distributed with this file, You can obtain one
-- at https://mozilla.org/MPL/2.0/.
--
-- This is showhtk.lua by poypoyan. https://github.com/poypoyan/showhtk
obs = obslua
ffi = require("ffi")

-- constants
if ffi.os == "Windows" then
	SUPER_KEY = "Win"
	RETURN_KEY = "Enter"
elseif ffi.os == "OSX" then
	SUPER_KEY = "Cmd"
	RETURN_KEY = "Return"
else
	SUPER_KEY = "Super"
	RETURN_KEY = "Return"
end

KEYBOARD_LAYOUT = { -- ind = true means that the key can be a standalone hotkey
{id = "ESC", jsn = "OBS_KEY_ESCAPE", txt = "Esc", ind = true},
{id = "F1", jsn = "OBS_KEY_F1", txt = "F1", ind = true},
{id = "F2", jsn = "OBS_KEY_F2", txt = "F2", ind = true},
{id = "F3", jsn = "OBS_KEY_F3", txt = "F3", ind = true},
{id = "F4", jsn = "OBS_KEY_F4", txt = "F4", ind = true},
{id = "F5", jsn = "OBS_KEY_F5", txt = "F5", ind = true},
{id = "F6", jsn = "OBS_KEY_F6", txt = "F6", ind = true},
{id = "F7", jsn = "OBS_KEY_F7", txt = "F7", ind = true},
{id = "F8", jsn = "OBS_KEY_F8", txt = "F8", ind = true},
{id = "F9", jsn = "OBS_KEY_F9", txt = "F9", ind = true},
{id = "F10", jsn = "OBS_KEY_F10", txt = "F10", ind = true},
{id = "F11", jsn = "OBS_KEY_F11", txt = "F11", ind = true},
{id = "F12", jsn = "OBS_KEY_F12", txt = "F12", ind = true},
{id = "DELETE", jsn = "OBS_KEY_DELETE", txt = "Del", ind = true},
{id = "RETURN", jsn = "OBS_KEY_RETURN", txt = RETURN_KEY, ind = true},
{id = "TILDE", jsn = "OBS_KEY_ASCIITILDE", txt = "`", ind = false},
{id = "MINUS", jsn = "OBS_KEY_MINUS", txt = "-", ind = false},
{id = "PLUS", jsn = "OBS_KEY_PLUS", txt = "=", ind = false},
{id = "BSPACE", jsn = "OBS_KEY_BACKSPACE", txt = "BS", ind = false},
{id = "TAB", jsn = "OBS_KEY_TAB", txt = "Tab", ind = false},
{id = "BLEFT", jsn = "OBS_KEY_BRACKETLEFT", txt = "[", ind = false},
{id = "BRIGHT", jsn = "OBS_KEY_BRACKETRIGHT", txt = "]", ind = false},
{id = "BSLASH", jsn = "OBS_KEY_BACKSLASH", txt = "\\", ind = false},
{id = "SCOLON", jsn = "OBS_KEY_SEMICOLON", txt = ";", ind = false},
{id = "APOS", jsn = "OBS_KEY_APOSTROPHE", txt = "'", ind = false},
{id = "COMMA", jsn = "OBS_KEY_COMMA", txt = ",", ind = false},
{id = "PERIOD", jsn = "OBS_KEY_PERIOD", txt = ".", ind = false},
{id = "SLASH", jsn = "OBS_KEY_SLASH", txt = "/", ind = false},
{id = "SPACE", jsn = "OBS_KEY_SPACE", txt = "Space", ind = false},
{id = "0", jsn = "OBS_KEY_0", txt = "0", ind = false},
{id = "1", jsn = "OBS_KEY_1", txt = "1", ind = false},
{id = "2", jsn = "OBS_KEY_2", txt = "2", ind = false},
{id = "3", jsn = "OBS_KEY_3", txt = "3", ind = false},
{id = "4", jsn = "OBS_KEY_4", txt = "4", ind = false},
{id = "5", jsn = "OBS_KEY_5", txt = "5", ind = false},
{id = "6", jsn = "OBS_KEY_6", txt = "6", ind = false},
{id = "7", jsn = "OBS_KEY_7", txt = "7", ind = false},
{id = "8", jsn = "OBS_KEY_8", txt = "8", ind = false},
{id = "9", jsn = "OBS_KEY_9", txt = "9", ind = false},
{id = "A", jsn = "OBS_KEY_A", txt = "A", ind = false},
{id = "B", jsn = "OBS_KEY_B", txt = "B", ind = false},
{id = "C", jsn = "OBS_KEY_C", txt = "C", ind = false},
{id = "D", jsn = "OBS_KEY_D", txt = "D", ind = false},
{id = "E", jsn = "OBS_KEY_E", txt = "E", ind = false},
{id = "F", jsn = "OBS_KEY_F", txt = "F", ind = false},
{id = "G", jsn = "OBS_KEY_G", txt = "G", ind = false},
{id = "H", jsn = "OBS_KEY_H", txt = "H", ind = false},
{id = "I", jsn = "OBS_KEY_I", txt = "I", ind = false},
{id = "J", jsn = "OBS_KEY_J", txt = "J", ind = false},
{id = "K", jsn = "OBS_KEY_K", txt = "K", ind = false},
{id = "L", jsn = "OBS_KEY_L", txt = "L", ind = false},
{id = "M", jsn = "OBS_KEY_M", txt = "M", ind = false},
{id = "N", jsn = "OBS_KEY_N", txt = "N", ind = false},
{id = "O", jsn = "OBS_KEY_O", txt = "O", ind = false},
{id = "P", jsn = "OBS_KEY_P", txt = "P", ind = false},
{id = "Q", jsn = "OBS_KEY_Q", txt = "Q", ind = false},
{id = "R", jsn = "OBS_KEY_R", txt = "R", ind = false},
{id = "S", jsn = "OBS_KEY_S", txt = "S", ind = false},
{id = "T", jsn = "OBS_KEY_T", txt = "T", ind = false},
{id = "U", jsn = "OBS_KEY_U", txt = "U", ind = false},
{id = "V", jsn = "OBS_KEY_V", txt = "V", ind = false},
{id = "W", jsn = "OBS_KEY_W", txt = "W", ind = false},
{id = "X", jsn = "OBS_KEY_X", txt = "X", ind = false},
{id = "Y", jsn = "OBS_KEY_Y", txt = "Y", ind = false},
{id = "Z", jsn = "OBS_KEY_Z", txt = "Z", ind = false},
}

SHORTCUT_COMBO = {
{id = "_", jsn = ""}, -- for ind = true keys in KEYBOARD_LAYOUT
{id = "_SHIFT_", jsn = ", \"shift\": true", txt = "Shift"}, -- for ind = true keys in KEYBOARD_LAYOUT
{id = "_CTRL_", jsn = ", \"control\": true", txt = "Ctrl"},
{id = "_CTRL_SHIFT_", jsn = ", \"control\": true, \"shift\": true", txt = "Ctrl+Shift"},
{id = "_CTRL_ALT_", jsn = ", \"control\": true, \"alt\": true", txt = "Ctrl+Alt"},
{id = "_CTRL_ALT_SHIFT_", jsn = ", \"control\": true, \"alt\": true, \"shift\": true", txt = "Ctrl+Alt+Shift"},
{id = "_ALT_", jsn = ", \"alt\": true", txt = "Alt"},
{id = "_ALT_SHIFT_", jsn = ", \"alt\": true, \"shift\": true", txt = "Alt+Shift"},
{id = "_CMD_", jsn = ", \"command\": true", txt = SUPER_KEY},
{id = "_CMD_SHIFT_", jsn = ", \"command\": true, \"shift\": true", txt = SUPER_KEY .. "+Shift"},
}

JSON_DATA = "{"
KEY_FORM = "\"SHOWHTK%s%s\": [{\"key\": \"%s\"%s}]%s"
for k1,v1 in pairs(SHORTCUT_COMBO) do
	for k2,v2 in pairs(KEYBOARD_LAYOUT) do
		local htk_text
		if v1.id == "_" then
			if not v2.ind then goto continue end
			htk_text = v2.txt
		elseif v1.id == "_SHIFT_" then
			if not v2.ind then goto continue end
			htk_text = v1.txt .. "+" .. v2.txt
		else
			htk_text = v1.txt .. "+" .. v2.txt
		end

		-- final absense of comma is apparently important in obs_data_create_from_json
		local comma
		if k1 == table.getn(SHORTCUT_COMBO) and k2 == table.getn(KEYBOARD_LAYOUT) then
			comma = ""
		else
			comma = ","
		end

		JSON_DATA = JSON_DATA .. KEY_FORM:format(v1.id, v2.id, v2.jsn, v1.jsn, comma)
		_G["SHOWHTK" .. v1.id .. v2.id] = function(pressed)
			if pressed then
				obs.timer_remove(remove_asterisk)
				obs.timer_remove(clear_text)
				g_source_text = htk_text
				update_text("*" .. htk_text)
				obs.timer_add(remove_asterisk, ASTERISK_DUR)
				obs.timer_add(clear_text, g_stay_seconds * 1000)
			end
		end
	::continue:: end
end
JSON_DATA = JSON_DATA .. "}"

ASTERISK_DUR = 300 -- asterisk signifies 'fresh' hotkey

-- global variables
g_source_name = ""
g_source_text = ""
g_stay_seconds = 3
g_is_activated = true -- TODO: use

----------------------------------------------------------

function update_text(text)
	local source = obs.obs_get_source_by_name(g_source_name)
	if source ~= nil then
		local settings = obs.obs_data_create()
		obs.obs_data_set_string(settings, "text", text)
		obs.obs_source_update(source, settings)
		obs.obs_data_release(settings)
		obs.obs_source_release(source)
	end
end

function remove_asterisk()
	obs.remove_current_callback()

	update_text(g_source_text)
end

function clear_text()
	obs.remove_current_callback()

	local source = obs.obs_get_source_by_name(g_source_name)
	source_id = obs.obs_source_get_unversioned_id(source)

	if source_id == "text_ft2_source" then
		update_text(" ") -- OBS can't set empty string to ft2
	else
		update_text("")
	end

	obs.obs_source_release(source)
end

----------------------------------------------------------

-- a function named script_load will be called on startup
function script_load(settings)
	local jsn = obs.obs_data_create_from_json(JSON_DATA)

	for _,v1 in pairs(SHORTCUT_COMBO) do
		for _,v2 in pairs(KEYBOARD_LAYOUT) do
			if (v1.id == "_" or v1.id == "_SHIFT_") and not v2.ind then goto continue end
			reg_hotkey(jsn, "SHOWHTK" .. v1.id .. v2.id)
		::continue:: end
	end

	obs.obs_data_release(jsn)
end

-- auxiliary function to script_load to register hotkey
function reg_hotkey(jsn, name_htk)
	local arr = obs.obs_data_get_array(jsn, name_htk)
	local htk = obs.obs_hotkey_register_frontend(script_path() .. name_htk, name_htk, _G[name_htk])
	obs.obs_hotkey_load(htk, arr)
	obs.obs_data_array_release(arr)
end

-- A function named script_description returns the description shown to
-- the user
function script_description()
	return "Show pressed common hotkey form (e.g. Ctrl+C, Alt+V) in screen. Made by poypoyan."
end

-- A function named script_properties defines the properties that the user
-- can change for the entire script module itself
function script_properties()
	local props = obs.obs_properties_create()
	obs.obs_properties_add_int(props, "duration", "Duration (seconds)", 1, 10, 1)

	local p = obs.obs_properties_add_list(props, "source", "Text Source", obs.OBS_COMBO_TYPE_EDITABLE, obs.OBS_COMBO_FORMAT_STRING)
	local sources = obs.obs_enum_sources()
	if sources ~= nil then
		for _, source in ipairs(sources) do
			source_id = obs.obs_source_get_unversioned_id(source)
			if source_id == "text_gdiplus" or source_id == "text_ft2_source" then
				local name = obs.obs_source_get_name(source)
				obs.obs_property_list_add_string(p, name, name)
			end
		end
	end
	obs.source_list_release(sources)

	return props
end

-- A function named script_update will be called when settings are changed
function script_update(settings)
	g_stay_seconds = obs.obs_data_get_int(settings, "duration")
	g_source_name = obs.obs_data_get_string(settings, "source")
end

-- A function named script_defaults will be called to set the default settings
function script_defaults(settings)
	obs.obs_data_set_default_int(settings, "duration", 3)
end
