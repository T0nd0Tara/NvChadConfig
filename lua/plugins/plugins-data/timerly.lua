return {
  "nvzone/timerly",
  cmd = "TimerlyToggle",
dependencies = {
    "nvzone/volt",
  },
  config = {
    minutes = { 25, 5 },
    on_finish = function()
      vim.notify "Timerly: Time's Up!"
      vim.fn.jobstart [[spd-say -t child_male "Time up"]]
    end,
    mapping = nil, -- is func
  },
}
