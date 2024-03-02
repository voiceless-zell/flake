{
  config,
  pkgs,
  lib,
  helpers,
  ...
}:
with lib;
let 
  cfg = config.modules.nixvim;
in {
  options.modules.nixvim = { enable = mkEnableOption "nixvim";};
  config = mkIf cfg.enable {

 # programs.lazygit.enable = true;

    programs.nixvim = {
      enable = true;
      colorschemes = {
          gruvbox.enable=true;
      };
        plugins = {
            lightline.enable = true;
  "hrsh7th/nvim-cmp" = {
      version = false;
      event = "InsertEnter";
      dependencies = [
        "hrsh7th/cmp-nvim-lsp"
        "hrsh7th/cmp-buffer"
        "hrsh7th/cmp-path"
      ];
      opts = ''
        vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
        local cmp = require("cmp")
        local defaults = require("cmp.config.default")()
        return {
          completion = {
            completeopt = "menu,menuone,noinsert",
          },
          mapping = cmp.mapping.preset.insert({
            ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
            ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
            ["<C-b>"] = cmp.mapping.scroll_docs(-4),
            ["<C-f>"] = cmp.mapping.scroll_docs(4),
            ["<C-Space>"] = cmp.mapping.complete(),
            ["<C-e>"] = cmp.mapping.abort(),
            ["<CR>"] = cmp.mapping.confirm({ select = true }),
            ["<S-CR>"] = cmp.mapping.confirm({
              behavior = cmp.ConfirmBehavior.Replace,
              select = true,
            }),
            ["<C-CR>"] = function(fallback)
              cmp.abort()
              fallback()
            end,
          }),
          sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "path" },
          }, {
            { name = "buffer" },
          }),
          formatting = {
            format = function(_, item)
              local icons = require("lazyvim.config").icons.kinds
              if icons[item.kind] then
                item.kind = icons[item.kind] .. item.kind
              end
              return item
            end,
          },
          experimental = {
            ghost_text = {
              hl_group = "CmpGhostText",
            },
          },
          sorting = defaults.sorting,
        }
      '';
      config = ''
        ---@param opts cmp.ConfigSchema
        config = function(_, opts)
          for _, source in ipairs(opts.sources) do
            source.group_index = source.group_index or 1
          end
          require("cmp").setup(opts)
        end
      '';
    };
  };
}
         #     luasnip = {
         #       enable = true;
         #       extraConfig = { 
         #         enable_autosnippets = true;
         #         store_selection_keys = "tab";
         #         };
         #     };
         #     mini = {
         #         enable = true;
         #         modules = {
         #             pairs = {};
         #             surround = {};
         #             ai = {};
         #             comment = {};
         #             bufremove = {};
         #             indentscope = {};
         #        };
         #     };
         #   neo-tree = {
         #       enable = true;
         #       enableGitStatus = true;
         #       enableRefreshOnWrite = true;
         #     };
         #   which-key = {
         #       enable = true;
#
         #     };
         #   gitsigns = {
         #       enable = true;
         #     };
         #   telescope = {
         #       enable = true;
         #     };
         #   conform-nvim = {
         #     enable = true;
         #     };
         #   treesitter = {
         #     enable = true;
         #   };
         #   treesitter-textobjects = {
         #       enable = true;
         #     };
         #   treesitter-context = {
         #       enable = true;
         #     };
         #   notify = {
         #       enable = true;
         #     };
         #   bufferline = {
         #       enable = true;
         #     };
         #   lualine = {
         #       enable = true;
         #     };
         #   indent-blankline = {
         #       enable = true;
         #     };
         #   noice = {
         #       enable = true;
         #     };
         #   dashboard = {
         #       enable = true;
         #     };
       };
    };
  };
}
