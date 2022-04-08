local status_ok, pp_vim = pcall(require, "pp-vim")
if not status_ok then
  return
end
require("telescope").load_extension("pp_vim")
