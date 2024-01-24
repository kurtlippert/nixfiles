{ pkgs, ... }:
{
  programs.nixvim = {
    enable = true;

    extraPlugins = with pkgs.vimPlugins; [
      # zenbones colorscheme
      zenbones-nvim
      lush-nvim

      # lsp
      nvim-lspconfig

      # lightline
      #lualine-nvim
    ];

    colorscheme = "zenbones";

    options = {
      termguicolors = true;	# better colors 
      relativenumber = true;	# show relative line numbers
      shiftwidth = 2;		# tab width should be 2
      laststatus = 2;		# statusline (always)
      wrap = false;		# disable line wrap
    };

    extraConfigLua = ''
      -- lsp
      require'lspconfig'.nil_ls.setup{}
      require'lspconfig'.ocamllsp.setup{}
    '';

  };
}
