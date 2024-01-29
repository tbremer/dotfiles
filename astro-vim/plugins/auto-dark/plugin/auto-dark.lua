local cmd = {
  macos = 'defaults read -g AppleInterfaceStyle',
  unix = '',
  windows = '',
}

local is_dark = function(output, sys)
  if sys == 'macos' then
    return string.match(output, "Dark")
  end

  if sys == 'unix' then
    return false
  end

  if sys == 'windows' then
    return false
  end

  print("unknown system:", sys)
end

local run = function()
  local cmdOut = vim.fn.system(cmd.macos);
  local background = "";

  if is_dark(cmdOut, "macos") then
    background="dark"
  else
    background="light"
  end

  vim.api.nvim_set_option_value("background", background, {})
end

-- always run the command first to ensure we have the right theme
run()

-- set a timer to run forever, every second, to check theme
vim.fn.timer_start(1000, run, { ["repeat"] = -1 })

