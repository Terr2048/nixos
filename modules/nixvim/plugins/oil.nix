{
  programs.nixvim = {
    plugins = {
      oil = {
        enable = true;
        settings = {
          view_options = {
            show_hidden = true;
          };
          keymaps = {
            "-" = false;
            "`" = false;
            "<S-Tab>" = "actions.cd";
          };
          cleanup_delay_ms = false;
          # experimental_watch_for_changes = true;
          keymaps_help.border = "none";
          float.border = "none";
          preview.border = "none";
          ssh.border = "none";
        };
      };
    };
  };
}
