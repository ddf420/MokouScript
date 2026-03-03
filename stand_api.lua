---@diagnostic disable: return-type-mismatch
---@meta
-- Stand Lua API - Dummy definitions for IDE support and Lua language server
-- Generated from Stand Lua API Documentation
-- Do NOT require or execute this file at runtime.

--------------------------------------------------------------------------------
-- Global Variables
--------------------------------------------------------------------------------

---@type string Name of your script (excludes `.lua`)
SCRIPT_NAME = ""

---@type string Filename of your script
SCRIPT_FILENAME = ""

---@type string Path to your script file from the Lua Scripts folder
SCRIPT_RELPATH = ""

---@type boolean True if script was started in direct response to a user action
SCRIPT_MANUAL_START = false

---@type boolean True if a silent start of your script is desired
SCRIPT_SILENT_START = false

---@type integer
INVALID_GUID = 0

-- COMMANDPERM constants
COMMANDPERM_FRIENDLY   = 0
COMMANDPERM_NEUTRAL    = 1
COMMANDPERM_SPAWN      = 2
COMMANDPERM_RUDE       = 3
COMMANDPERM_AGGRESSIVE = 4
COMMANDPERM_TOXIC      = 5
COMMANDPERM_USERONLY   = 6

-- CLICK_TYPE constants
CLICK_MENU        = 0
CLICK_COMMAND     = 1
CLICK_HOTKEY      = 2
CLICK_BULK        = 3
CLICK_AUTO        = 4
CLICK_SCRIPTED    = 5
CLICK_WEB         = 6
CLICK_WEB_COMMAND = 7
CLICK_CHAT_ALL    = 8
CLICK_CHAT_TEAM   = 9

-- CLICK_FLAG bitflags
CLICK_FLAG_AUTO = 0
CLICK_FLAG_CHAT = 0
CLICK_FLAG_WEB  = 0

-- TOAST constants
TOAST_ABOVE_MAP  = 1
TOAST_CONSOLE    = 2
TOAST_FILE       = 4
TOAST_WEB        = 8
TOAST_CHAT       = 16
TOAST_CHAT_TEAM  = 32
TOAST_DEFAULT    = 9   -- TOAST_ABOVE_MAP | TOAST_WEB
TOAST_LOGGER     = 6   -- TOAST_CONSOLE | TOAST_FILE
TOAST_ALL        = 15  -- TOAST_DEFAULT | TOAST_LOGGER

-- COMMAND_TYPE constants
COMMAND_LINK                          = 0
COMMAND_ACTION                        = 1
COMMAND_ACTION_ITEM                   = 2
COMMAND_INPUT                         = 3
COMMAND_TEXTSLIDER                    = 4
COMMAND_TEXTSLIDER_STATEFUL           = 5
COMMAND_READONLY_NAME                 = 6
COMMAND_READONLY_VALUE                = 7
COMMAND_READONLY_LINK                 = 8
COMMAND_DIVIDER                       = 9
COMMAND_LIST                          = 10
COMMAND_LIST_CUSTOM_SPECIAL_MEANING   = 11
COMMAND_LIST_PLAYER                   = 12
COMMAND_LIST_COLOUR                   = 13
COMMAND_LIST_HISTORICPLAYER           = 14
COMMAND_LIST_READONLY                 = 15
COMMAND_LIST_REFRESHABLE              = 16
COMMAND_LIST_CONCEALER                = 17
COMMAND_LIST_SEARCH                   = 18
COMMAND_LIST_NAMESHARE                = 19
COMMAND_LIST_ACTION                   = 20
COMMAND_LIST_SELECT                   = 21
COMMAND_TOGGLE_NO_CORRELATION         = 22
COMMAND_TOGGLE                        = 23
COMMAND_TOGGLE_CUSTOM                 = 24
COMMAND_SLIDER                        = 25
COMMAND_SLIDER_FLOAT                  = 26
COMMAND_SLIDER_RAINBOW                = 27
COMMAND_FLAG_LIST                     = 0
COMMAND_FLAG_LIST_ACTION              = 0
COMMAND_FLAG_TOGGLE                   = 0
COMMAND_FLAG_SLIDER                   = 0
COMMAND_FULLTYPEFLAG                  = 0
COMMAND_FIRST_PHYSICAL                = 0

-- LISTINDICATOR constants
LISTINDICATOR_ARROW            = 0
LISTINDICATOR_ARROW_IF_CHILDREN = 1
LISTINDICATOR_OFF              = 2
LISTINDICATOR_ON               = 3

-- ALIGN constants (for directx.draw_text)
ALIGN_TOP_LEFT      = 0
ALIGN_TOP_CENTRE    = 1
ALIGN_TOP_RIGHT     = 2
ALIGN_CENTRE_LEFT   = 3
ALIGN_CENTRE        = 4
ALIGN_CENTRE_RIGHT  = 5
ALIGN_BOTTOM_LEFT   = 6
ALIGN_BOTTOM_CENTRE = 7
ALIGN_BOTTOM_RIGHT  = 8

--------------------------------------------------------------------------------
-- Types (annotations only)
--------------------------------------------------------------------------------

---@class Vector3
---@field x number
---@field y number
---@field z number

---@class Colour
---@field r number  0.0–1.0
---@field g number  0.0–1.0
---@field b number  0.0–1.0
---@field a number  0.0–1.0

---@alias Label string|integer  A string or return value of lang.register

---@class CommandRef
---@field menu_name Label
---@field command_names table
---@field help_text Label
---@field name_for_config string
---@field visible boolean
---@field value integer|boolean|string
---@field min_value integer
---@field max_value integer
---@field step_size integer
---@field precision integer
---@field indicator_type integer
---@field target CommandRef
local CommandRef = {}
function CommandRef:getPhysical() return CommandRef end
function CommandRef:equals(other) return false end
function CommandRef:isValid() return false end
function CommandRef:refByRelPath(path) return CommandRef end
function CommandRef:delete() end
function CommandRef:defaultAndDelete() end
function CommandRef:detach() return CommandRef end
---@param ... any
function CommandRef:attach(...) return CommandRef end
---@param ... any
function CommandRef:attachAfter(...) return CommandRef end
---@param ... any
function CommandRef:attachBefore(...) return CommandRef end
function CommandRef:focus() end
function CommandRef:isFocused() return false end
---@param include_user boolean?
function CommandRef:getApplicablePlayers(include_user) return {} end
function CommandRef:getParent() return CommandRef end
function CommandRef:getType() return 0 end
function CommandRef:getChildren() return {} end
function CommandRef:getFocus() return CommandRef end
function CommandRef:getFocusPhysical() return CommandRef end
function CommandRef:trigger() end
---@param callback function
function CommandRef:onTickInViewport(callback) return 0 end
---@param callback function
function CommandRef:onFocus(callback) return 0 end
---@param callback function
function CommandRef:onBlur(callback) return 0 end
---@param handler_id integer
function CommandRef:removeHandler(handler_id) return false end
function CommandRef:getState() return "" end
function CommandRef:getDefaultState() return "" end
---@param state string
function CommandRef:setState(state) return "" end
function CommandRef:applyDefaultState() return "" end
function CommandRef:recursivelyApplyDefaultState() return "" end
---@param options table
function CommandRef:setListActionOptions(options) end
---@param options table
function CommandRef:setTextsliderOptions(options) end
---@param value integer
---@param replacement string
function CommandRef:addValueReplacement(value, replacement) end
function CommandRef:setTemporary() end
---@param ... any
function CommandRef:list(...) return CommandRef end
---@param ... any
function CommandRef:action(...) return CommandRef end
---@param ... any
function CommandRef:toggle(...) return CommandRef end
---@param ... any
function CommandRef:toggle_loop(...) return CommandRef end
---@param ... any
function CommandRef:slider(...) return CommandRef end
---@param ... any
function CommandRef:slider_float(...) return CommandRef end
---@param ... any
function CommandRef:click_slider(...) return CommandRef end
---@param ... any
function CommandRef:click_slider_float(...) return CommandRef end
---@param ... any
function CommandRef:list_select(...) return CommandRef end
---@param ... any
function CommandRef:list_action(...) return CommandRef end
---@param ... any
function CommandRef:text_input(...) return CommandRef end
---@param ... any
function CommandRef:colour(...) return CommandRef end
---@param ... any
function CommandRef:rainbow(...) return CommandRef end
---@param ... any
function CommandRef:inline_rainbow(...) return CommandRef end
---@param ... any
function CommandRef:divider(...) return CommandRef end
---@param ... any
function CommandRef:readonly(...) return CommandRef end
---@param ... any
function CommandRef:readonly_name(...) return CommandRef end
---@param ... any
function CommandRef:hyperlink(...) return CommandRef end
---@param ... any
function CommandRef:textslider(...) return CommandRef end
---@param ... any
function CommandRef:textslider_stateful(...) return CommandRef end
---@param ... any
function CommandRef:player_list_players_shortcut(...) return CommandRef end
---@param ... any
function CommandRef:link(...) return CommandRef end

---@class CommandUniqPtr : CommandRef
local CommandUniqPtr = {}
function CommandUniqPtr:ref() return CommandRef end

--------------------------------------------------------------------------------
-- menu
--------------------------------------------------------------------------------

---@class menu
menu = {}

---@return CommandRef
function menu.my_root() return CommandRef end

---@param player_id integer
---@return CommandRef
function menu.player_root(player_id) return CommandRef end

---@return CommandRef
function menu.shadow_root() return CommandRef end

---@param path string
---@param tree_version integer?
---@return CommandRef
function menu.ref_by_path(path, tree_version) return CommandRef end

---@param base integer
---@param path string
---@return CommandRef
function menu.ref_by_rel_path(base, path) return CommandRef end

---@param command_name string
---@return CommandRef
function menu.ref_by_command_name(command_name) return CommandRef end

---@param parent CommandRef
---@param menu_name Label
---@param command_names table
---@param help_text Label?
---@param on_click function?
---@param on_back function?
---@param on_active_list_update function?
---@return CommandRef|CommandUniqPtr
function menu.list(parent, menu_name, command_names, help_text, on_click, on_back, on_active_list_update) return CommandRef end

---@param parent CommandRef
---@param menu_name Label
---@param command_names table
---@param help_text Label
---@param on_click function
---@param on_command function?
---@param syntax string?
---@param perm integer?
---@return CommandRef|CommandUniqPtr
function menu.action(parent, menu_name, command_names, help_text, on_click, on_command, syntax, perm) return CommandRef end

---@param parent CommandRef
---@param menu_name Label
---@param command_names table
---@param help_text Label
---@param on_change function
---@param default_on boolean?
---@param perm integer?
---@return CommandRef|CommandUniqPtr
function menu.toggle(parent, menu_name, command_names, help_text, on_change, default_on, perm) return CommandRef end

---@param parent CommandRef
---@param menu_name Label
---@param command_names table
---@param help_text Label
---@param on_tick function
---@param on_stop function?
---@param perm integer?
---@return CommandRef|CommandUniqPtr
function menu.toggle_loop(parent, menu_name, command_names, help_text, on_tick, on_stop, perm) return CommandRef end

---@param parent CommandRef
---@param menu_name Label
---@param command_names table
---@param help_text Label
---@param min_value integer
---@param max_value integer
---@param default_value integer
---@param step_size integer
---@param on_change function
---@return CommandRef|CommandUniqPtr
function menu.slider(parent, menu_name, command_names, help_text, min_value, max_value, default_value, step_size, on_change) return CommandRef end

---@param parent CommandRef
---@param menu_name Label
---@param command_names table
---@param help_text Label
---@param min_value integer
---@param max_value integer
---@param default_value integer
---@param step_size integer
---@param on_change function
---@return CommandRef|CommandUniqPtr
function menu.slider_float(parent, menu_name, command_names, help_text, min_value, max_value, default_value, step_size, on_change) return CommandRef end

---@param parent CommandRef
---@param menu_name Label
---@param command_names table
---@param help_text Label
---@param min_value integer
---@param max_value integer
---@param default_value integer
---@param step_size integer
---@param on_click function
---@return CommandRef|CommandUniqPtr
function menu.click_slider(parent, menu_name, command_names, help_text, min_value, max_value, default_value, step_size, on_click) return CommandRef end

---@param parent CommandRef
---@param menu_name Label
---@param command_names table
---@param help_text Label
---@param min_value integer
---@param max_value integer
---@param default_value integer
---@param step_size integer
---@param on_click function
---@return CommandRef|CommandUniqPtr
function menu.click_slider_float(parent, menu_name, command_names, help_text, min_value, max_value, default_value, step_size, on_click) return CommandRef end

---@param parent CommandRef
---@param menu_name Label
---@param command_names table
---@param help_text Label
---@param options table
---@param default_value integer
---@param on_change function
---@return CommandRef|CommandUniqPtr
function menu.list_select(parent, menu_name, command_names, help_text, options, default_value, on_change) return CommandRef end

---@param parent CommandRef
---@param menu_name Label
---@param command_names table
---@param help_text Label
---@param options table
---@param on_item_click function
---@return CommandRef|CommandUniqPtr
function menu.list_action(parent, menu_name, command_names, help_text, options, on_item_click) return CommandRef end

---@param parent CommandRef
---@param menu_name Label
---@param command_names table
---@param help_text Label
---@param on_change function
---@param default_value string?
---@return CommandRef|CommandUniqPtr
function menu.text_input(parent, menu_name, command_names, help_text, on_change, default_value) return CommandRef end

---@param parent CommandRef
---@param menu_name Label
---@param command_names table
---@param help_text Label
---@param default Colour
---@param transparency boolean
---@param on_change function
---@return CommandRef|CommandUniqPtr
function menu.colour(parent, menu_name, command_names, help_text, default, transparency, on_change) return CommandRef end

---@param colour_command CommandRef
---@return CommandRef|CommandUniqPtr
function menu.rainbow(colour_command) return CommandRef end

---@param colour_command CommandRef
---@return CommandRef|CommandUniqPtr
function menu.inline_rainbow(colour_command) return CommandRef end

---@param parent CommandRef
---@param menu_name Label
---@return CommandRef|CommandUniqPtr
function menu.divider(parent, menu_name) return CommandRef end

---@param parent CommandRef
---@param menu_name Label
---@param value string?
---@return CommandRef|CommandUniqPtr
function menu.readonly(parent, menu_name, value) return CommandRef end

---@param parent CommandRef
---@param menu_name Label
---@return CommandRef|CommandUniqPtr
function menu.readonly_name(parent, menu_name) return CommandRef end

---@param parent CommandRef
---@param menu_name Label
---@param link string
---@param help_text Label?
---@return CommandRef|CommandUniqPtr
function menu.hyperlink(parent, menu_name, link, help_text) return CommandRef end

---@param parent CommandRef
---@param menu_name Label
---@param command_names table
---@param help_text Label
---@param options table
---@param on_click function
---@return CommandRef|CommandUniqPtr
function menu.textslider(parent, menu_name, command_names, help_text, options, on_click) return CommandRef end

---@param parent CommandRef
---@param menu_name Label
---@param command_names table
---@param help_text Label
---@param options table
---@param on_click function
---@return CommandRef|CommandUniqPtr
function menu.textslider_stateful(parent, menu_name, command_names, help_text, options, on_click) return CommandRef end

---@param parent CommandRef
---@param menu_name Label
---@param command_name string
---@param single_only boolean?
---@return CommandRef|CommandUniqPtr
function menu.player_list_players_shortcut(parent, menu_name, command_name, single_only) return CommandRef end

---@param parent CommandRef
---@param target CommandRef
---@param show_address_in_corner boolean?
---@return CommandRef|CommandUniqPtr
function menu.link(parent, target, show_address_in_corner) return CommandRef end

function menu.apply_command_states() end

---@param command CommandRef
function menu.delete(command) end

---@param command CommandRef
function menu.default_and_delete(command) end

---@param old CommandRef
---@param new CommandUniqPtr
---@return CommandRef
function menu.replace(old, new) return CommandRef end

---@param command CommandRef
---@return CommandUniqPtr
function menu.detach(command) return CommandUniqPtr end

---@param parent CommandRef
---@param command CommandUniqPtr
---@return CommandRef
function menu.attach(parent, command) return CommandRef end

---@param anchor CommandRef|CommandUniqPtr
---@param command CommandUniqPtr
---@return CommandRef
function menu.attach_after(anchor, command) return CommandRef end

---@param anchor CommandRef|CommandUniqPtr
---@param command CommandUniqPtr
---@return CommandRef
function menu.attach_before(anchor, command) return CommandRef end

---@param ref CommandRef
---@return boolean
function menu.is_ref_valid(ref) return false end

---@param command CommandRef
function menu.focus(command) end

---@param command CommandRef
---@return boolean
function menu.is_focused(command) return false end

---@param command CommandRef
---@param include_user boolean?
---@return table
function menu.get_applicable_players(command, include_user) return {} end

---@param command CommandRef
---@return CommandRef
function menu.get_parent(command) return CommandRef end

---@param command CommandRef
---@return integer
function menu.get_type(command) return 0 end

---@param list CommandRef
---@return table
function menu.get_children(list) return {} end

---@param list CommandRef
---@return CommandRef
function menu.list_get_focus(list) return CommandRef end

---@param list CommandRef
---@return CommandRef
function menu.list_get_focus_physical(list) return CommandRef end

---@return integer
function menu.collect_garbage() return 0 end

---@return boolean
function menu.is_open() return false end

---@return number, number
function menu.get_position() return 0, 0 end

---@return number, number, number, number
function menu.get_main_view_position_and_size() return 0, 0, 0, 0 end

---@return CommandRef
function menu.get_current_menu_list() return CommandRef end

---@return CommandRef
function menu.get_current_ui_list() return CommandRef end

---@param even_when_disabled boolean?
---@param even_when_inappropriate boolean?
---@return string
function menu.get_active_list_cursor_text(even_when_disabled, even_when_inappropriate) return "" end

---@return boolean
function menu.are_tabs_visible() return false end

---@param prefill string
function menu.show_command_box(prefill) end

---@param click_type integer
---@param prefill string
function menu.show_command_box_click_based(click_type, prefill) end

---@param input string
function menu.trigger_commands(input) end

---@param command CommandRef
---@param arg string
function menu.trigger_command(command, arg) end

---@return boolean
function menu.command_box_is_open() return false end

---@return number, number, number, number
function menu.command_box_get_dimensions() return 0, 0, 0, 0 end

---@return boolean
function menu.is_in_screenshot_mode() return false end

---@param command CommandRef
---@param callback function
---@return integer
function menu.on_tick_in_viewport(command, callback) return 0 end

---@param command CommandRef
---@param callback function
---@return integer
function menu.on_focus(command, callback) return 0 end

---@param command CommandRef
---@param callback function
---@return integer
function menu.on_blur(command, callback) return 0 end

---@param command CommandRef
---@param handler_id integer
---@return boolean
function menu.remove_handler(command, handler_id) return false end

---@param command CommandRef|CommandUniqPtr
---@return Label
function menu.get_physical(command) return "" end

---@param command CommandRef|CommandUniqPtr
---@return Label
function menu.get_menu_name(command) return "" end

---@param command CommandRef|CommandUniqPtr
---@return table
function menu.get_command_names(command) return {} end

---@param command CommandRef|CommandUniqPtr
---@return Label
function menu.get_help_text(command) return "" end

---@param command CommandRef|CommandUniqPtr
---@return string
function menu.get_name_for_config(command) return "" end

---@param command CommandRef
---@return boolean
function menu.get_visible(command) return false end

---@param command CommandRef
---@return integer|boolean|string
function menu.get_value(command) return 0 end

---@param command CommandRef
---@return integer
function menu.get_min_value(command) return 0 end

---@param command CommandRef
---@return integer
function menu.get_max_value(command) return 0 end

---@param command CommandRef
---@return integer
function menu.get_step_size(command) return 0 end

---@param command CommandRef
---@return integer
function menu.get_precision(command) return 0 end

---@param command CommandRef
---@return integer
function menu.get_indicator_type(command) return 0 end

---@param command CommandRef
---@return CommandRef
function menu.get_target(command) return CommandRef end

---@param command CommandRef
---@return string
function menu.get_state(command) return "" end

---@param command CommandRef
---@return string
function menu.get_default_state(command) return "" end

---@param command CommandRef
---@param state string
---@return string
function menu.set_state(command, state) return "" end

---@param command CommandRef
---@return string
function menu.apply_default_state(command) return "" end

---@param list CommandRef
---@return string
function menu.recursively_apply_default_state(list) return "" end

---@param command CommandRef|CommandUniqPtr
---@param menu_name Label
function menu.set_menu_name(command, menu_name) end

---@param command CommandRef|CommandUniqPtr
---@param command_names table
function menu.set_command_names(command, command_names) end

---@param command CommandRef|CommandUniqPtr
---@param help_text Label
function menu.set_help_text(command, help_text) end

---@param command CommandRef|CommandUniqPtr
---@param name_for_config string
function menu.set_name_for_config(command, name_for_config) end

---@param command CommandRef
---@param visible boolean
function menu.set_visible(command, visible) end

---@param command CommandRef
---@param value integer|boolean|string
function menu.set_value(command, value) end

---@param command CommandRef
---@param min_value integer
function menu.set_min_value(command, min_value) end

---@param command CommandRef
---@param max_value integer
function menu.set_max_value(command, max_value) end

---@param command CommandRef
---@param step_size integer
function menu.set_step_size(command, step_size) end

---@param command CommandRef
---@param precision integer
function menu.set_precision(command, precision) end

---@param command CommandRef
---@param indicator_type integer
function menu.set_indicator_type(command, indicator_type) end

---@param command CommandRef
---@param target CommandRef
function menu.set_target(command, target) end

---@param command CommandRef
---@param options table
function menu.set_list_action_options(command, options) end

---@param command CommandRef
---@param options table
function menu.set_textslider_options(command, options) end

---@param command CommandRef
---@param value integer
---@param replacement string
function menu.add_value_replacement(command, value, replacement) end

---@param command CommandRef
function menu.set_temporary(command) end

---@param command CommandRef
---@param click_type integer
---@param message string
---@param proceed_callback function
---@param cancel_callback function?
---@param skippable boolean?
function menu.show_warning(command, click_type, message, proceed_callback, cancel_callback, skippable) end

---@return integer
function menu.get_activation_key_hash() return 0 end

---@return integer
function menu.get_edition() return 0 end

---@return table
function menu.get_version() return {} end

--------------------------------------------------------------------------------
-- players
--------------------------------------------------------------------------------

---@class players
players = {}

---@param callback function  Called with (player_id, player_root)
function players.add_command_hook(callback) end

---@param callback function  Called with (player_id)
---@return integer
function players.on_join(callback) return 0 end

---@param callback function  Called with (player_id, name)
---@return integer
function players.on_leave(callback) return 0 end

function players.dispatch_on_join() end

---@param player_id integer
---@return boolean
function players.exists(player_id) return false end

---@return integer
function players.user() return 0 end

---@return integer
function players.user_ped() return 0 end

---@param include_user boolean?
---@param include_friends boolean?
---@param include_strangers boolean?
---@return table
function players.list(include_user, include_friends, include_strangers) return {} end

---@param include_user boolean?
---@param include_friends boolean?
---@param include_crew_members boolean?
---@param include_org_members boolean?
---@param include_modders boolean?
---@param include_likely_modders boolean?
---@return table
function players.list_only(include_user, include_friends, include_crew_members, include_org_members, include_modders, include_likely_modders) return {} end

---@param exclude_user boolean?
---@param exclude_friends boolean?
---@param exclude_crew_members boolean?
---@param exclude_org_members boolean?
---@param exclude_modders boolean?
---@param exclude_likely_modders boolean?
---@return table
function players.list_except(exclude_user, exclude_friends, exclude_crew_members, exclude_org_members, exclude_modders, exclude_likely_modders) return {} end

---@param include_user boolean?
---@return table
function players.list_all_with_excludes(include_user) return {} end

---@return integer
function players.get_host() return 0 end

---@return integer
function players.get_script_host() return 0 end

---@return table
function players.get_focused() return {} end

---@param player_id integer
---@param ignore_streamer_spoof boolean?
---@return string
function players.get_name(player_id, ignore_streamer_spoof) return "" end

---@param player_id integer
---@return integer
function players.get_rockstar_id(player_id) return 0 end

---@param player_id integer
---@return integer
function players.get_ip(player_id) return 0 end

---@param player_id integer
---@return string
function players.get_ip_string(player_id) return "" end

---@param player_id integer
---@return integer
function players.get_port(player_id) return 0 end

---@param player_id integer
---@return integer
function players.get_connect_ip(player_id) return 0 end

---@param player_id integer
---@return integer
function players.get_connect_port(player_id) return 0 end

---@param player_id integer
---@return integer
function players.get_lan_ip(player_id) return 0 end

---@param player_id integer
---@return integer
function players.get_lan_port(player_id) return 0 end

---@param player_id integer
---@return boolean
function players.are_stats_ready(player_id) return false end

---@param player_id integer
---@return integer
function players.get_rank(player_id) return 0 end

---@param player_id integer
---@return integer
function players.get_rp(player_id) return 0 end

---@param player_id integer
---@return integer
function players.get_money(player_id) return 0 end

---@param player_id integer
---@return integer
function players.get_wallet(player_id) return 0 end

---@param player_id integer
---@return integer
function players.get_bank(player_id) return 0 end

---@param player_id integer
---@return number
function players.get_kd(player_id) return 0 end

---@param player_id integer
---@return integer
function players.get_kills(player_id) return 0 end

---@param player_id integer
---@return integer
function players.get_deaths(player_id) return 0 end

---@param player_id integer
---@return integer
function players.get_language(player_id) return 0 end

---@param player_id integer
---@return boolean
function players.is_using_controller(player_id) return false end

---@param player_id integer
---@return string
function players.get_name_with_tags(player_id) return "" end

---@param player_id integer
---@return string
function players.get_tags_string(player_id) return "" end

---@param player_id integer
---@return boolean
function players.is_godmode(player_id) return false end

---@param player_id integer
---@return boolean
function players.is_marked_as_modder(player_id) return false end

---@param player_id integer
---@return boolean
function players.is_marked_as_modder_or_admin(player_id) return false end

---@param player_id integer
---@return boolean
function players.is_marked_as_admin(player_id) return false end

---@param player_id integer
---@return boolean
function players.is_marked_as_attacker(player_id) return false end

---@param player_id integer
---@return boolean
function players.is_otr(player_id) return false end

---@param player_id integer
---@return boolean
function players.is_out_of_sight(player_id) return false end

---@param player_id integer
---@return boolean
function players.is_in_interior(player_id) return false end

---@param player_id integer
---@return boolean
function players.is_typing(player_id) return false end

---@param player_id integer
---@return boolean
function players.is_using_vpn(player_id) return false end

---@param player_id integer
---@return boolean
function players.is_visible(player_id) return false end

---@param player_id integer
---@return string
function players.get_host_token(player_id) return "" end

---@param player_id integer
---@return string
function players.get_host_token_hex(player_id) return "" end

---@param player_id integer
---@return number
function players.get_host_queue_position(player_id) return 0 end

---@param include_user boolean?
---@param include_friends boolean?
---@param include_strangers boolean?
---@return table
function players.get_host_queue(include_user, include_friends, include_strangers) return {} end

---@param player_id integer
---@return integer
function players.get_boss(player_id) return -1 end

---@param player_id integer
---@return integer
function players.get_org_type(player_id) return -1 end

---@param player_id integer
---@return integer
function players.get_org_colour(player_id) return -1 end

---@param player_id integer
---@return string
function players.clan_get_motto(player_id) return "" end

---@param player_id integer
---@return userdata
function players.get_position(player_id) return nil end

---@param player_id integer
---@return boolean
function players.is_in_vehicle(player_id) return false end

---@param player_id integer
---@return integer
function players.get_vehicle_model(player_id) return 0 end

---@param player_id integer
---@return boolean
function players.is_using_rc_vehicle(player_id) return false end

---@param player_id integer
---@return integer?
function players.get_bounty(player_id) return nil end

---@param recipient integer
---@param text string
function players.send_sms(recipient, text) end

---@param player_id integer
---@return Vector3
function players.get_cam_pos(player_id) return {x=0,y=0,z=0} end

---@param player_id integer
---@return Vector3
function players.get_cam_rot(player_id) return {x=0,y=0,z=0} end

---@param player_id integer
---@return integer
function players.get_spectate_target(player_id) return -1 end

---@param player_id integer
---@return number, number, number, boolean
function players.get_waypoint(player_id) return 0, 0, 0, false end

---@param player_id integer
---@return integer
function players.get_net_player(player_id) return 0 end

---@param player_id integer
---@param wanted_level integer
---@return integer
function players.set_wanted_level(player_id, wanted_level) return 0 end

---@param player_id integer
---@param reward string|integer
---@return integer
function players.give_pickup_reward(player_id, reward) return 0 end

---@param player_id integer
---@return number
function players.get_weapon_damage_modifier(player_id) return 0 end

---@param player_id integer
---@return number
function players.get_melee_weapon_damage_modifier(player_id) return 0 end

---@param player_id integer
---@param name Label
---@param toast_flags integer?
---@param severity integer?
---@return CommandRef
function players.add_detection(player_id, name, toast_flags, severity) return CommandRef end

---@param callback function  Called with (p, name, extra)
---@return integer
function players.on_flow_event_done(callback) return 0 end

---@param player_id integer
---@param x number
---@param y number
function players.teleport_2d(player_id, x, y) end

---@param player_id integer
---@param x number
---@param y number
---@param z number
function players.teleport_3d(player_id, x, y, z) end

---@param player_id integer
---@return integer?
function players.get_millis_since_discovery(player_id) return nil end

---@param player_id integer
---@return CommandRef
function players.detections_root(player_id) return CommandRef end

--------------------------------------------------------------------------------
-- entities
--------------------------------------------------------------------------------

---@class entities
entities = {}

---@param type integer
---@param hash integer
---@param pos Vector3
---@param heading number
---@return integer
function entities.create_ped(type, hash, pos, heading) return 0 end

---@param hash integer
---@param pos Vector3
---@param heading number
---@return integer
function entities.create_vehicle(hash, pos, heading) return 0 end

---@param hash integer
---@param pos Vector3
---@return integer
function entities.create_object(hash, pos) return 0 end

---@param include_last_vehicle boolean?
---@return integer
function entities.get_user_vehicle_as_handle(include_last_vehicle) return 0 end

---@param include_last_vehicle boolean?
---@return integer
function entities.get_user_vehicle_as_pointer(include_last_vehicle) return 0 end

---@return integer
function entities.get_user_personal_vehicle_as_handle() return 0 end

---@param handle integer
---@return integer
function entities.handle_to_pointer(handle) return 0 end

---@param addr integer
---@return boolean
function entities.has_handle(addr) return false end

---@param addr integer
---@return integer
function entities.pointer_to_handle(addr) return 0 end

---@return table
function entities.get_all_vehicles_as_handles() return {} end

---@return table
function entities.get_all_vehicles_as_pointers() return {} end

---@return table
function entities.get_all_peds_as_handles() return {} end

---@return table
function entities.get_all_peds_as_pointers() return {} end

---@return table
function entities.get_all_objects_as_handles() return {} end

---@return table
function entities.get_all_objects_as_pointers() return {} end

---@return table
function entities.get_all_pickups_as_handles() return {} end

---@return table
function entities.get_all_pickups_as_pointers() return {} end

---@param handle_or_ptr integer
function entities.delete(handle_or_ptr) end

---@param handle_or_ptr integer
---@return integer
function entities.get_model_hash(handle_or_ptr) return 0 end

---@param handle_or_ptr integer
---@return integer
function entities.get_model_uhash(handle_or_ptr) return 0 end

---@param addr integer
---@return Vector3
function entities.get_position(addr) return {x=0,y=0,z=0} end

---@param addr integer
---@return Vector3
function entities.get_rotation(addr) return {x=0,y=0,z=0} end

---@param handle_or_ptr integer
---@return number
function entities.get_health(handle_or_ptr) return 0 end

---@param handle_or_ptr integer
---@param modType integer
---@return number
function entities.get_upgrade_value(handle_or_ptr, modType) return 0 end

---@param handle_or_ptr integer
---@param modType integer
---@return number
function entities.get_upgrade_max_value(handle_or_ptr, modType) return 0 end

---@param handle_or_ptr integer
---@param modType integer
---@param value integer
---@return number
function entities.set_upgrade_value(handle_or_ptr, modType, value) return 0 end

---@param addr integer
---@return integer
function entities.get_current_gear(addr) return 0 end

---@param addr integer
---@param current_gear integer
function entities.set_current_gear(addr, current_gear) end

---@param addr integer
---@return integer
function entities.get_next_gear(addr) return 0 end

---@param addr integer
---@param next_gear integer
function entities.set_next_gear(addr, next_gear) end

---@param addr integer
---@return number
function entities.get_rpm(addr) return 0 end

---@param addr integer
---@param rpm number
function entities.set_rpm(addr, rpm) end

---@param addr integer
---@return number
function entities.get_gravity(addr) return 0 end

---@param addr integer
---@param gravity number
---@return number
function entities.set_gravity(addr, gravity) return 0 end

---@param addr integer
---@param gravity_multiplier number
---@return number
function entities.set_gravity_multiplier(addr, gravity_multiplier) return 0 end

---@param addr integer
---@return number
function entities.get_boost_charge(addr) return 0 end

---@param addr integer
---@return integer
function entities.get_draw_handler(addr) return 0 end

---@param addr integer
---@return integer
function entities.vehicle_draw_handler_get_pearlecent_colour(addr) return 0 end

---@param addr integer
---@return integer
function entities.vehicle_draw_handler_get_wheel_colour(addr) return 0 end

---@param addr integer
---@return boolean
function entities.get_vehicle_has_been_owned_by_player(addr) return false end

---@param addr integer
---@return integer
function entities.get_player_info(addr) return 0 end

---@param addr integer
---@return integer
function entities.player_info_get_game_state(addr) return 0 end

---@param addr integer
---@return integer
function entities.get_weapon_manager(addr) return 0 end

---@param handle_or_ptr integer
---@return integer
function entities.get_head_blend_data(handle_or_ptr) return 0 end

---@param handle_or_ptr integer
---@return integer?
function entities.get_net_object(handle_or_ptr) return nil end

---@param handle_or_ptr integer
---@return integer
function entities.get_owner(handle_or_ptr) return 0 end

---@param handle_or_ptr integer
---@param can_migrate boolean
function entities.set_can_migrate(handle_or_ptr, can_migrate) end

---@param handle_or_ptr integer
---@return boolean
function entities.get_can_migrate(handle_or_ptr) return false end

---@param handle_or_ptr integer
---@param player integer
function entities.give_control(handle_or_ptr, player) end

---@param addr integer
---@return integer
function entities.vehicle_get_handling(addr) return 0 end

---@param handling_addr integer
---@param type integer
---@return integer
function entities.handling_get_subhandling(handling_addr, type) return 0 end

---@param handle_or_ptr integer
---@param wheel_index integer
function entities.detach_wheel(handle_or_ptr, wheel_index) end

---@param handle_or_ptr integer
---@return Vector3
function entities.get_bomb_bay_position(handle_or_ptr) return {x=0,y=0,z=0} end

---@param handle_or_ptr integer
---@return boolean
function entities.is_player_ped(handle_or_ptr) return false end

---@param handle_or_ptr integer
---@return boolean
function entities.is_invulnerable(handle_or_ptr) return false end

---@param handle_or_ptr integer
---@param timeout integer?
---@return boolean
function entities.request_control(handle_or_ptr, timeout) return false end

--------------------------------------------------------------------------------
-- chat
--------------------------------------------------------------------------------

---@class chat
chat = {}

---@param callback function  Called with (sender, reserved, text, team_chat, networked, is_auto)
---@return integer
function chat.on_message(callback) return 0 end

---@param text string
---@param team_chat boolean
---@param add_to_local_history boolean
---@param networked boolean
function chat.send_message(text, team_chat, add_to_local_history, networked) end

---@param recipient integer
---@param sender integer
---@param text string
---@param team_chat boolean
function chat.send_targeted_message(recipient, sender, text, team_chat) end

---@return integer  0=Closed, 1=Team, 2=All
function chat.get_state() return 0 end

---@return boolean
function chat.is_open() return false end

function chat.open() end
function chat.close() end

---@return string
function chat.get_draft() return "" end

---@param team_chat boolean
function chat.ensure_open_with_empty_draft(team_chat) end

---@param appendix string
function chat.add_to_draft(appendix) end

---@param characters integer
function chat.remove_from_draft(characters) end

---@return table
function chat.get_history() return {} end

--------------------------------------------------------------------------------
-- directx
--------------------------------------------------------------------------------

---@class directx
directx = {}

---@param path string
---@return integer
function directx.create_texture(path) return 0 end

---@param id integer
---@return boolean?
function directx.has_texture_loaded(id) return nil end

---@param id integer
---@return integer, integer
function directx.get_texture_dimensions(id) return 0, 0 end

---@param id integer
---@return string
function directx.get_texture_character(id) return "" end

---@param id integer
---@param sizeX number
---@param sizeY number
---@param centerX number
---@param centerY number
---@param posX number
---@param posY number
---@param rotation number
---@param colour Colour
function directx.draw_texture(id, sizeX, sizeY, centerX, centerY, posX, posY, rotation, colour) end

---@param id integer
---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param colour Colour
function directx.draw_texture_by_points(id, x1, y1, x2, y2, colour) end

---@param path string
---@return userdata
function directx.create_font(path) return nil end

---@param x number
---@param y number
---@param text string
---@param alignment integer
---@param scale number
---@param colour Colour
---@param force_in_bounds boolean?
---@param font userdata?
---@param draw_origin_3d Vector3?
function directx.draw_text(x, y, text, alignment, scale, colour, force_in_bounds, font, draw_origin_3d) end

---@param x number
---@param y number
---@param width number
---@param height number
---@param colour Colour
function directx.draw_rect(x, y, width, height, colour) end

---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param colour Colour
---@param colour2 Colour?
function directx.draw_line(x1, y1, x2, y2, colour, colour2) end

---@param x1 number
---@param y1 number
---@param x2 number
---@param y2 number
---@param x3 number
---@param y3 number
---@param colour Colour
function directx.draw_triangle(x1, y1, x2, y2, x3, y3, colour) end

---@param x number
---@param y number
---@param radius number
---@param colour Colour
---@param part integer?
function directx.draw_circle(x, y, radius, colour, part) end

---@return number, number
function directx.get_client_size() return 0, 0 end

---@param text string
---@param scale number?
---@param font userdata?
---@return number, number
function directx.get_text_size(text, scale, font) return 0, 0 end

---@param x number
---@param y number
---@return number, number
function directx.pos_hud_to_client(x, y) return 0, 0 end

---@param x number
---@param y number
---@return number, number
function directx.size_hud_to_client(x, y) return 0, 0 end

---@param x number
---@param y number
---@return number, number
function directx.pos_client_to_hud(x, y) return 0, 0 end

---@param x number
---@param y number
---@return number, number
function directx.size_client_to_hud(x, y) return 0, 0 end

---@return integer
function directx.blurrect_new() return 0 end

---@param instance integer
function directx.blurrect_free(instance) end

---@param instance integer
---@param x number
---@param y number
---@param width number
---@param height number
---@param strength integer
function directx.blurrect_draw(instance, x, y, width, height, strength) end

--------------------------------------------------------------------------------
-- util
--------------------------------------------------------------------------------

---@class util
util = {}

---@param version integer|string
---@param flavour string?
function util.require_natives(version, flavour) end

---@param func function
function util.execute_in_os_thread(func) end

---@param file string
function util.require_no_lag(file) end

---@param func function
---@return thread
function util.create_tick_handler(func) return coroutine.create(func) end

---@param func function
---@return boolean
function util.try_run(func) return false end

function util.keep_running() end

---@param wake_in_ms integer?
function util.yield(wake_in_ms) end

---@return boolean, boolean
function util.can_continue() return true, false end

---@param busy boolean
function util.set_busy(busy) end

---@param thread_func function
---@param ... any
---@return thread
function util.create_thread(thread_func, ...) return coroutine.create(thread_func) end

function util.stop_thread() end

---@param thrd thread
function util.shoot_thread(thrd) end

---@param thrd thread
---@return boolean
function util.is_scheduled_in(thrd) return false end

function util.restart_script() end
function util.stop_script() end

---@param func function
function util.on_pre_stop(func) end

---@param func function
function util.on_stop(func) end

---@param message string
---@param bitflags integer?
function util.toast(message, bitflags) end

---@param message string
function util.log(message) end

---@param text string
function util.draw_debug_text(text) end

---@param text string
function util.draw_centred_text(text) end

---@param message string
function util.show_corner_help(message) end

---@param message string
---@param replacement_message string
function util.replace_corner_help(message, replacement_message) end

---@param wanted_level integer
function util.set_local_player_wanted_level(wanted_level) end

---@param text string
---@return integer
function util.joaat(text) return 0 end

---@param text string
---@return integer
function util.ujoaat(text) return 0 end

---@param hash integer
---@return string
function util.reverse_joaat(hash) return "" end

---@param model integer|string
---@return boolean
function util.is_this_model_a_blimp(model) return false end

---@param model integer|string
---@return boolean
function util.is_this_model_an_object(model) return false end

---@param model integer|string
---@return boolean
function util.is_this_model_a_submarine(model) return false end

---@param model integer|string
---@return boolean
function util.is_this_model_a_submarine_car(model) return false end

---@param model integer|string
---@return boolean
function util.is_this_model_a_trailer(model) return false end

---@return table
function util.get_vehicles() return {} end

---@return table
function util.get_objects() return {} end

---@return table
function util.get_weapons() return {} end

---@param message string
function util.BEGIN_TEXT_COMMAND_DISPLAY_TEXT(message) end

---@param message string
function util._BEGIN_TEXT_COMMAND_LINE_COUNT(message) end

---@param message string
function util.BEGIN_TEXT_COMMAND_IS_THIS_HELP_MESSAGE_BEING_DISPLAYED(message) end

---@param message string
function util.BEGIN_TEXT_COMMAND_DISPLAY_HELP(message) end

---@param message string
function util._BEGIN_TEXT_COMMAND_GET_WIDTH(message) end

---@param message string
function util.BEGIN_TEXT_COMMAND_THEFEED_POST(message) end

---@param rank integer
---@return integer
function util.get_rp_required_for_rank(rank) return 0 end

---@return integer
function util.get_session_players_bitflag() return 0 end

---@param session_player_bitflags integer
---@param args table
---@param reinterpret_floats boolean?
function util.trigger_script_event(session_player_bitflags, args, reinterpret_floats) end

---@return integer
function util.current_time_millis() return 0 end

---@return integer
function util.current_unix_time_seconds() return 0 end

---@param handler_id integer
---@return boolean
function util.remove_handler(handler_id) return false end

---@return boolean
function util.is_session_started() return false end

---@return boolean
function util.is_session_transition_active() return false end

---@return integer
function util.get_char_slot() return 0 end

---@param x number
---@param y number
---@param z_hint number?
---@return boolean, number
function util.get_ground_z(x, y, z_hint) return false, 0 end

---@param script string|integer
---@param func function
---@return boolean
function util.spoof_script(script, func) return false end

---@param thread_id integer
---@param func function
---@return boolean
function util.spoof_script_thread(thread_id, func) return false end

---@param blip integer
---@return boolean
function util.remove_blip(blip) return false end

---@return boolean
function util.arspinner_is_enabled() return false end

function util.arspinner_enable() end
function util.arspinner_disable() end

---@return boolean
function util.graceland_is_enabled() return false end

function util.graceland_enable() end
function util.graceland_disable() end

---@return boolean
function util.is_bigmap_active() return false end

---@param text string
---@param notify boolean?
function util.copy_to_clipboard(text, notify) end

---@return string
function util.get_clipboard_text() return "" end

---@param file string
---@return table
function util.read_colons_and_tabs_file(file) return {} end

---@param file string
---@param data table
function util.write_colons_file(file, data) end

---@param pos Vector3
function util.draw_ar_beacon(pos) end

---@param pos Vector3
---@param rot Vector3
---@param dimensions Vector3
---@param r integer
---@param g integer
---@param b integer
---@param a integer?
function util.draw_box(pos, rot, dimensions, r, g, b, a) end

---@param pos Vector3
---@param radius integer
---@param r integer
---@param g integer
---@param b integer
---@param a integer?
---@param quality integer?
function util.draw_sphere(pos, radius, r, g, b, a, quality) end

---@param script string|integer
---@return boolean
function util.request_script_host(script) return false end

---@param script string|integer
---@param player integer
---@return boolean
function util.give_script_host(script, player) return false end

---@param path string
---@return boolean
function util.register_file(path) return false end

---@param label_key integer|string
---@return string
function util.get_label_text(label_key) return "" end

---@param text string
---@return string
function util.register_label(text) return "" end

---@param vk integer|string
---@return boolean
function util.is_key_down(vk) return false end

---@param addr integer
---@param ... integer|userdata|string
---@return integer
function util.call_foreign_function(addr, ...) return 0 end

---@param inst_addr integer
---@return string
function util.get_rtti_name(inst_addr) return "" end

---@param inst_addr integer
---@return string
function util.get_rtti_hierarchy(inst_addr) return "" end

---@param hash integer|string
function util.set_particle_fx_asset(hash) end

---@param blip_handle integer
---@return integer
function util.blip_handle_to_pointer(blip_handle) return 0 end

---@param blip_handle integer
---@return integer
function util.get_blip_display(blip_handle) return 0 end

---@param x number
---@param y number
function util.teleport_2d(x, y) end

---@return boolean
function util.is_interaction_menu_open() return false end

---@param callback function
---@return integer
function util.on_transition_finished(callback) return 0 end

---@param target_r integer
---@param target_g integer
---@param target_b integer
---@param target_a integer?
---@return integer
function util.get_closest_hud_colour(target_r, target_g, target_b, target_a) return 0 end

---@return boolean
function util.is_soup_netintel_inited() return false end

---@param callback function  Called with (light_duration, light_intensity, heavy_duration, heavy_intensity, delay_after_this_one)
---@return integer
function util.on_pad_shake(callback) return 0 end

---@param model integer|string
---@param timeout integer?
function util.request_model(model, timeout) end

---@param path string
function util.open_folder(path) end

---@param use_nil boolean?
---@return boolean
function util.set_nullptr_preference(use_nil) return false end

---@return integer
function util.get_tps() return 0 end

---@return boolean, string?
function util.get_session_code() return false, nil end

---@param stat integer|string
---@return integer?
function util.stat_get_type(stat) return nil end

---@param stat integer|string
---@return integer?
function util.stat_get_int64(stat) return nil end

---@param stat integer|string
---@param value integer
function util.stat_set_int64(stat, value) end

---@param list CommandRef
---@param bitflags integer?
---@param command_names_prefix table?
---@return integer
function util.new_toast_config(list, bitflags, command_names_prefix) return 0 end

---@param tc integer
---@return integer
function util.toast_config_get_flags(tc) return 0 end

---@param hash integer|string
---@return integer
function util.get_model_info(hash) return 0 end

---@param name string
---@param allow_folder boolean
---@return boolean
function util.is_valid_file_name(name, allow_folder) return false end

---@param r number
---@param g number
---@param b number
---@return number, number, number
function util.rgb2hsv(r, g, b) return 0, 0, 0 end

---@param h number
---@param s number
---@param v number
---@return number, number, number
function util.hsv2rgb(h, s, v) return 0, 0, 0 end

---@param r number
---@param g number
---@param b number
---@return number
function util.calculate_luminance(r, g, b) return 0 end

---@param r1 number
---@param g1 number
---@param b1 number
---@param r2 number
---@param g2 number
---@param b2 number
---@return number
function util.calculate_contrast(r1, g1, b1, r2, g2, b2) return 0 end

---@param r1 number
---@param g1 number
---@param b1 number
---@param r2 number
---@param g2 number
---@param b2 number
---@return boolean
function util.is_contrast_sufficient(r1, g1, b1, r2, g2, b2) return false end

---@param pos Vector3
function util.set_waypoint(pos) end

---@param cam integer
---@param x number
---@param y number
---@param z number
---@param w number
function util.set_cam_quaternion(cam, x, y, z, w) end

---@param fWorldX number
---@param fWorldY number
---@param fWorldZ number
---@param pOutScreenX number
---@param pOutScreenY number
---@return boolean
function util.get_screen_coord_from_world_coord_no_adjustment(fWorldX, fWorldY, fWorldZ, pOutScreenX, pOutScreenY) return false end

---@param utf8 string
---@return string
function util.utf8_to_utf16(utf8) return "" end

---@param utf16 string
---@return string
function util.utf16_to_utf8(utf16) return "" end

---@param slot integer
---@return table, boolean
function util.get_gps_route(slot) return {}, false end

---@param rockstar_id integer
---@return boolean
function util.sc_is_blocked(rockstar_id) return false end

---@param rockstar_id integer
function util.sc_block(rockstar_id) end

---@param rockstar_id integer
function util.sc_unblock(rockstar_id) end

---@param path string
---@return thread
function util.play_wav(path) return coroutine.create(function() end) end

---@param slot integer
---@param x number
---@param y number
function util.ui3dscene_set_element_2d_position(slot, x, y) end

---@param slot integer
---@param width number
---@param height number
function util.ui3dscene_set_element_2d_size(slot, width, height) end

---@param slot integer
---@param colour Colour
function util.ui3dscene_set_element_background_colour(slot, colour) end

---@param str string
---@return integer?
function util.ip_from_string(str) return nil end

---@param ip integer
---@return string
function util.ip_to_string(ip) return "" end

---@param ip integer
---@return table?
function util.ip_get_as(ip) return nil end

---@param ip integer
---@return table?
function util.ip_get_location(ip) return nil end

--------------------------------------------------------------------------------
-- v3
--------------------------------------------------------------------------------

---@class v3
v3 = {}

---@overload fun(x: number, y: number, z: number): userdata
---@overload fun(pos: Vector3): userdata
---@overload fun(): userdata
---@param x number
---@param y number
---@param z number
---@return userdata
function v3.new(x, y, z) return nil end

---@param addr userdata|integer
---@return number, number, number
function v3.get(addr) return 0, 0, 0 end

---@param addr userdata|integer
---@return number
function v3.getX(addr) return 0 end

---@param addr userdata|integer
---@return number
function v3.getY(addr) return 0 end

---@param addr userdata|integer
---@return number
function v3.getZ(addr) return 0 end

---@param addr userdata|integer
---@return number
function v3.getHeading(addr) return 0 end

---@param addr userdata|integer
---@param x number
---@param y number
---@param z number
---@return userdata|integer
function v3.set(addr, x, y, z) return addr end

---@param addr userdata|integer
---@param x number
---@return userdata|integer
function v3.setX(addr, x) return addr end

---@param addr userdata|integer
---@param y number
---@return userdata|integer
function v3.setY(addr, y) return addr end

---@param addr userdata|integer
---@param z number
---@return userdata|integer
function v3.setZ(addr, z) return addr end

---@param addr userdata|integer
---@return userdata|integer
function v3.reset(addr) return addr end

---@param a userdata|integer
---@param b userdata|integer
---@return userdata|integer
function v3.add(a, b) return a end

---@param a userdata|integer
---@param b userdata|integer
---@return userdata|integer
function v3.sub(a, b) return a end

---@param a userdata|integer
---@param f number
---@return userdata|integer
function v3.mul(a, f) return a end

---@param a userdata|integer
---@param f number
---@return userdata|integer
function v3.div(a, f) return a end

---@param a userdata|integer
---@param b userdata|integer
---@return userdata|integer
function v3.addNew(a, b) return nil end

---@param a userdata|integer
---@param b userdata|integer
---@return userdata|integer
function v3.subNew(a, b) return nil end

---@param a userdata|integer
---@param f number
---@return userdata|integer
function v3.mulNew(a, f) return nil end

---@param a userdata|integer
---@param f number
---@return userdata|integer
function v3.divNew(a, f) return nil end

---@param a userdata|integer
---@param b userdata|integer
---@return boolean
function v3.eq(a, b) return false end

---@param a userdata|integer
---@return number
function v3.magnitude(a) return 0 end

---@param a userdata|integer
---@param b userdata|integer
---@return number
function v3.distance(a, b) return 0 end

---@param addr userdata|integer
---@return userdata|integer
function v3.abs(addr) return addr end

---@param addr userdata|integer
function v3.sum(addr) end

---@param addr userdata|integer
---@return number
function v3.min(addr) return 0 end

---@param addr userdata|integer
---@return number
function v3.max(addr) return 0 end

---@param a userdata|integer
---@param b integer
---@return number
function v3.dot(a, b) return 0 end

---@param addr userdata|integer
---@return userdata|integer
function v3.normalise(addr) return addr end

---@param a userdata|integer
---@param b integer
---@return userdata
function v3.crossProduct(a, b) return nil end

---@param addr userdata|integer
---@return userdata
function v3.toRot(addr) return nil end

---@param a userdata|integer
---@param b integer
---@return userdata
function v3.lookAt(a, b) return nil end

---@param addr userdata|integer
---@return userdata
function v3.toDir(addr) return nil end

---@param addr userdata|integer
---@return string
function v3.toString(addr) return "" end

--------------------------------------------------------------------------------
-- lang
--------------------------------------------------------------------------------

---@class lang
lang = {}

---@return string
function lang.get_current() return "" end

---@param lang_code string
---@return boolean
function lang.is_code_valid(lang_code) return false end

---@param lang_code string
---@return string
function lang.get_code_for_soup(lang_code) return "" end

---@param lang_code string
---@return boolean
function lang.is_automatically_translated(lang_code) return false end

---@param lang_code string
---@return boolean
function lang.is_english(lang_code) return false end

---@param text string
---@return integer
function lang.register(text) return 0 end

---@param lang_code string
function lang.set_translate(lang_code) end

---@param label integer
---@param text string
function lang.translate(label, text) end

---@param text string
---@param lang_code string?
---@return integer
function lang.find(text, lang_code) return 0 end

---@param text string
---@param lang_code string?
---@return integer
function lang.find_builtin(text, lang_code) return 0 end

---@param text string
---@param lang_code string?
---@return integer
function lang.find_registered(text, lang_code) return 0 end

---@param label Label
---@param lang_code string?
---@return string
function lang.get_string(label, lang_code) return "" end

---@param label Label
---@return string
function lang.get_localised(label) return "" end

---@param label integer
---@return boolean
function lang.is_mine(label) return false end

---@param label integer
---@return boolean
function lang.is_builtin(label) return false end

---@param country_code string
---@param lang_code string
---@return string?
function lang.get_country_name(country_code, lang_code) return nil end

--------------------------------------------------------------------------------
-- filesystem
--------------------------------------------------------------------------------

---@class filesystem
filesystem = {}

---@return string
function filesystem.appdata_dir() return "" end

---@return string
function filesystem.stand_dir() return "" end

---@return string
function filesystem.scripts_dir() return "" end

---@return string
function filesystem.resources_dir() return "" end

---@return string
function filesystem.store_dir() return "" end

---@param path string
---@return boolean
function filesystem.exists(path) return false end

---@param path string
---@return boolean
function filesystem.is_regular_file(path) return false end

---@param path string
---@return boolean
function filesystem.is_dir(path) return false end

---@param path string
function filesystem.mkdir(path) end

---@param path string
function filesystem.mkdirs(path) end

---@param path string
---@return table
function filesystem.list_files(path) return {} end

--------------------------------------------------------------------------------
-- async_http
--------------------------------------------------------------------------------

---@class async_http
async_http = {}

---@return boolean
function async_http.have_access() return false end

---@param host string
---@param path string?
---@param success_func function?
---@param fail_func function?
function async_http.init(host, path, success_func, fail_func) end

function async_http.dispatch() end

---@param content_type string
---@param payload string
function async_http.set_post(content_type, payload) end

---@param key string
---@param value string
function async_http.add_header(key, value) end

---@param method string
function async_http.set_method(method) end

function async_http.prefer_ipv6() end

--------------------------------------------------------------------------------
-- memory
--------------------------------------------------------------------------------

---@class memory
memory = {}

---@param global integer
---@return integer
function memory.script_global(global) return 0 end

---@param script string|integer
---@param local_ integer
---@return integer
function memory.script_local(script, local_) return 0 end

---@param size integer?
---@return userdata
function memory.alloc(size) return nil end

---@return userdata
function memory.alloc_int() return nil end

---@return userdata
function memory.alloc_float() return nil end

---@param pattern string
---@return integer
function memory.scan(pattern) return 0 end

---@param script string|integer
---@param pattern string
---@return integer?
function memory.scan_script(script, pattern) return nil end

---@param addr integer
---@return integer
function memory.rip(addr) return 0 end

---@param ud userdata
---@return lightuserdata
function memory.addrof(ud) return nil end

---@param addr integer|userdata
---@return integer
function memory.read_byte(addr) return 0 end

---@param addr integer|userdata
---@return integer
function memory.read_ubyte(addr) return 0 end

---@param addr integer|userdata
---@return integer
function memory.read_short(addr) return 0 end

---@param addr integer|userdata
---@return integer
function memory.read_ushort(addr) return 0 end

---@param addr integer|userdata
---@return integer
function memory.read_int(addr) return 0 end

---@param addr integer|userdata
---@return integer
function memory.read_uint(addr) return 0 end

---@param addr integer|userdata
---@return integer
function memory.read_long(addr) return 0 end

---@param addr integer|userdata
---@return number
function memory.read_float(addr) return 0 end

---@param addr integer|userdata
---@return string
function memory.read_string(addr) return "" end

---@param addr integer|userdata
---@return Vector3
function memory.read_vector3(addr) return {x=0,y=0,z=0} end

---@param addr integer|userdata
---@param size integer
---@return string
function memory.read_binary_string(addr, size) return "" end

---@param addr integer|userdata
---@param value integer
function memory.write_byte(addr, value) end

---@param addr integer|userdata
---@param value integer
function memory.write_ubyte(addr, value) end

---@param addr integer|userdata
---@param value integer
function memory.write_short(addr, value) end

---@param addr integer|userdata
---@param value integer
function memory.write_ushort(addr, value) end

---@param addr integer|userdata
---@param value integer
function memory.write_int(addr, value) end

---@param addr integer|userdata
---@param value integer
function memory.write_uint(addr, value) end

---@param addr integer|userdata
---@param value integer
function memory.write_long(addr, value) end

---@param addr integer|userdata
---@param value number
function memory.write_float(addr, value) end

---@param addr integer|userdata
---@param value string
function memory.write_string(addr, value) end

---@param addr integer|userdata
---@param value Vector3
function memory.write_vector3(addr, value) end

---@param addr integer|userdata
---@param value string
function memory.write_binary_string(addr, value) end

---@return string
function memory.get_name_of_this_module() return "" end

---@param hash integer|string
---@return integer
function memory.tunable(hash) return 0 end

---@param hash integer|string
---@return integer
function memory.tunable_offset(hash) return 0 end

--------------------------------------------------------------------------------
-- profiling
--------------------------------------------------------------------------------

---@class profiling
profiling = {}

---@param name string
---@param func function
function profiling.once(name, func) end

---@param name string
---@param func function
function profiling.tick(name, func) end
