local repo_url = "https://github.com/nizamiza/rpm.git"
local install_path = vim.fn.stdpath("config") .. "/pack/plugins/start/rpm"

if vim.fn.isdirectory(install_path) == 0 then
  vim.notify("Installing RPM...")
  vim.fn.mkdir(install_path, "p")

  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    repo_url,
    install_path
  })

  vim.notify("RPM installed.")
  require("rpm").install_all()
end

vim.cmd("packloadall")
return require("rpm")
