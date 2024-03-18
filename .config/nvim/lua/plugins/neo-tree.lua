return{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "kyazdani42/nvim-web-devicons", -- Correcting the package name
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            -- Add this block to configure the width
            window = {
                width = 25, -- Adjust this number to make the window narrower or wider
            },
            -- Other configurations for NeoTree can be added here as needed
        })
        vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>')
    end
}

