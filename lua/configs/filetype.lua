vim.filetype.add {
  filename = {
    ["build.zig.zon"] = "zig",
  },
  pattern = {
    ['.*%.blade%.php'] = 'blade',
  },
}
