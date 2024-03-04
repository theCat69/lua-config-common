---@class TableUtils
local M = {}

local function table_merge(t1, t2)
  for k, v in pairs(t2) do
    if type(v) == "table" then
      if type(t1[k] or false) == "table" then
        table_merge(t1[k] or {}, t2[k] or {})
      else
        t1[k] = v
      end
    else
      t1[k] = v
    end
  end
  return t1
end

---Merge all tables into a new one. The last one overrinding keys from the precendent.
---@param ... table[]
function M.table_merge(...)
  local origin_table = {}
  for _, tab in ipairs({ ... }) do
    table_merge(origin_table, tab)
  end
  return origin_table
end

---Merge all tables into an array.
---@param ... table[]
function M.tables_array(...)
  return { ... }
end

return M
