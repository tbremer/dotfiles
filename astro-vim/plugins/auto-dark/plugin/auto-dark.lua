local min_version = 'nvim-0.10.0'
-- eventually get the system
local sys = 'macos'
-- different commands for different systems as arrays
local cmd = {
  macos = {'defaults', 'read', '-g', 'AppleInterfaceStyle'},
  unix = {},
  windows = {},
}
-- caching the last appearance so we don't set the option more than we need to
local last_light
-- this could be an option maybe
local timeout = 1000

-- check version, if not nightly print an error and exit
if vim.fn.has(min_version) == 0 then
  print('not supported')
  return;
end

-- query the output to determine if we are in darkmode
local is_dark = function(output, sys)
  if sys == 'macos' then
    return string.find(output, "Dark")
  end

  if sys == 'unix' then
    return false
  end

  if sys == 'windows' then
    return false
  end

  print("unknown system:", sys)
end

-- set the background if it has changed, return early otherwise
local set_bg = function(light)
  if last_light == light then
    return
  end

  last_light = light

  local background=""
  if is_dark(light, sys) then
    background="dark"
  else
    background="light"
  end

  vim.api.nvim_set_option_value('background', background, {})
end

-- this is our loop, it runs the command specified by the system
local run = function()
  vim.system(
    cmd[sys],
    { text = true },
    vim.schedule_wrap(function(obj)
      if obj.stdout then
        set_bg(obj.stdout)
      end
    end)
  )
end


-- always run the command first to ensure we have the right theme
run()

-- start a timer
vim.fn.timer_start(timeout, run, { ["repeat"] = -1 })

