local utilities = {}

---@param color string
local function color_to_rgb(color)
  local function byte(value, offset) return bit.band(bit.rshift(value, offset), 0xFF) end

  local new_color = vim.api.nvim_get_color_by_name(color)
  if new_color == -1 then new_color = vim.opt.background:get() == "dark" and 000 or 255255255 end

  return { byte(new_color, 16), byte(new_color, 8), byte(new_color, 0) }
end

local blend_cache = {}

--- Blends two colors based on alpha transparency.
--- Adapted from: https://github.com/rose-pine/neovim/blob/main/lua/rose-pine/utilities.lua
--- Original license: MIT
---@param color string Color to blend
---@param base_color string Base color to blend on
---@param alpha number Between 0 (background) and 1 (foreground)
---@return string # A hex color string like "#RRGGBB"
function utilities.blend(color, base_color, alpha)
  local cache_key = color .. base_color .. alpha
  if blend_cache[cache_key] then return blend_cache[cache_key] end

  local fg_rgb = color_to_rgb(color)
  local bg_rgb = color_to_rgb(base_color)

  local function blend_channel(i)
    local ret = (alpha * fg_rgb[i] + ((1 - alpha) * bg_rgb[i]))
    return math.floor(math.min(math.max(0, ret), 255) + 0.5)
  end

  local result = string.format("#%02X%02X%02X", blend_channel(1), blend_channel(2), blend_channel(3))

  blend_cache[cache_key] = result
  return result
end

return utilities
