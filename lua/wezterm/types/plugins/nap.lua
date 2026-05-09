---@meta
---@diagnostic disable:unused-local

---@class Nap.PluginSpec
---@field [1]? string Repository shorthand, such as `owner/repo`.
---@field name? string Stable plugin name.
---@field url? string Explicit plugin URL.
---@field dir? string Local plugin directory.
---@field import? string Lua module that returns more specs.
---@field enabled? boolean|fun(): boolean Whether the plugin is enabled.
---@field priority? number Higher priority plugins load first.
---@field dev? boolean Prefer a local development checkout.
---@field groups? string[] Optional grouping labels.
---@field opts? table Options passed to the plugin config callback.
---@field config? fun(plugin: Nap.Plugin, config: table, opts?: table) Plugin configuration callback.
---@field branch? string Git branch pin.
---@field tag? string Git tag pin.
---@field commit? string Git commit pin.
---@field dependencies? Nap.PluginSpec[] Dependent plugin specs.

---@class Nap.Plugin
---@field name string Plugin name.
---@field url string Resolved plugin URL.
---@field dir? string Local plugin directory.
---@field enabled boolean
---@field priority number
---@field opts? table
---@field config? fun(plugin: Nap.Plugin, config: table, opts?: table)
---@field dependencies? Nap.Plugin[]

---@class Nap.DevConfig
---@field path string Base development checkout path.
---@field patterns string[] Repository patterns resolved locally when `dev = true`.
---@field fallback boolean Fall back to remote URLs when no local pattern matches.

---@class Nap.InstallConfig
---@field missing boolean Install missing plugins during setup.
---@field auto_clean boolean Remove stale plugins automatically.

---@class Nap.UpdateConfig
---@field enabled boolean Enable update checks.
---@field interval_hours number Minimum hours between update checks.
---@field startup_delay_ms number Delay before startup update checks.
---@field timeout_ms number Update check timeout.
---@field notify "off"|"log"|"event"|"both" Notification behavior.
---@field include_prerelease boolean Include prerelease versions.
---@field retry_count number Retry count for update checks.
---@field retry_delay_ms number Delay between retries.
---@field concurrency? number Maximum concurrent update checks.
---@field cooldown_s number Cooldown after update checks.

---@class Nap.UiConfig
---@field fuzzy boolean Use fuzzy matching in selector UIs.
---@field icons boolean|table Use icons in selector UIs.
---@field colorscheme "auto"|string|table Selector colorscheme.
---@field height? number Selector height.
---@field show_url boolean Show plugin URL in selector entries.
---@field show_priority boolean Show plugin priority in selector entries.

---@class Nap.IntegrationConfig
---@field input_selector boolean Enable InputSelector integration.
---@field command_palette boolean Enable command-palette entries.

---@class Nap.SpecDefaults
---@field enabled boolean Default enabled value for specs.
---@field priority number Default priority for specs.

---@class Nap.Config
---@field log_level "debug"|"info"|"warn"|"error"
---@field integrations Nap.IntegrationConfig
---@field keymaps boolean|table
---@field dev Nap.DevConfig
---@field install Nap.InstallConfig
---@field lockfile? string
---@field updates Nap.UpdateConfig
---@field ui Nap.UiConfig
---@field specs { defaults: Nap.SpecDefaults }

---@class Nap.Status
---@field configured boolean
---@field plugins Nap.Plugin[]
---@field count integer
---@field loaded integer
---@field lockfile? string

---@class Nap.CleanEntry
---@field name string
---@field path string

---@class Nap
local M = {}

---Expand dependency declarations into plugin specs.
---@param raw_specs Nap.PluginSpec[]
---@return Nap.PluginSpec[] specs
function M._expand_dependencies(raw_specs) end

---Configure plugins and apply enabled specs to a WezTerm config table.
---@param config table WezTerm config table.
---@param specs Nap.PluginSpec[] Plugin specs.
---@param nap_opts? table Nap options.
---@return table config The mutated WezTerm config table.
function M.setup(config, specs, nap_opts) end

---Require a plugin by name or URL.
---@param name_or_url string Plugin name or URL.
---@return table plugin Loaded plugin module.
function M.require(name_or_url) end

---Apply already configured plugins to a WezTerm config table.
---@param config table WezTerm config table.
---@param opts? table Apply options.
---@return table config The mutated WezTerm config table.
function M.apply_to_config(config, opts) end

---Return runtime plugin-manager status.
---@return Nap.Status status
function M.status() end

---Update all managed plugins.
function M.update_all() end

---Update one managed plugin.
---@param name string Plugin name.
---@return boolean ok
---@return string|nil error_message
function M.update_one(name) end

---Remove stale plugin checkouts.
---@return Nap.CleanEntry[] removed
function M.clean() end

---Write a lockfile snapshot.
---@param path? string Snapshot path.
---@return boolean ok
---@return string|nil error_message
function M.snapshot(path) end

---Restore plugins from a lockfile snapshot.
---@param path? string Snapshot path.
---@return table|nil result
function M.restore(path) end

---Return the internal Nap state table.
---@return table state
function M._get_state() end

---Build a Nap action table.
---@param name string Action name.
---@param payload? table Action payload.
---@return table action
function M.action(name, payload) end

---Open the Nap status selector.
---@return table action
function M.action_status() end

---Update all plugins from an action.
---@return table action
function M.action_update_all() end

---Update a specific plugin from an action.
---@param name string Plugin name.
---@return table action
function M.action_update_one(name) end

---Uninstall a specific plugin from an action.
---@param name string Plugin name.
---@return table action
function M.action_uninstall(name) end

---Toggle a specific plugin from an action.
---@param name string Plugin name.
---@return table action
function M.action_toggle(name) end

---Open a plugin directory from an action.
---@param name string Plugin name.
---@return table action
function M.action_open_dir(name) end

---Clean stale plugins from an action.
---@return table action
function M.action_clean() end

---Create a lockfile snapshot from an action.
---@param path? string Snapshot path.
---@return table action
function M.action_snapshot(path) end

---Restore a lockfile snapshot from an action.
---@param path? string Snapshot path.
---@return table action
function M.action_restore(path) end

---Return command-palette entries for Nap actions.
---@return table[] entries
function M.command_palette_entries() end

-- vim: set ts=2 sts=2 sw=2 et ai si sta:
