local M = {}

M.base46 = {
    theme = "neofusion",
}

M.ui = {
    tabufline = {
        order = { "buffers", "tabs" },
        lazyload = false,
    },
}

M.nvdash = {
    load_on_startup = true,
    header = {
        "⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿           ",
        "⠀⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣾⣶⣦⣄⠀⢸⣿           ",
        "⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⡿⠀⢸⡿           ",
        "⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⠿⠛⠋⠉⠁⠀⣾⠃⢀          ",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣷⣶⣶⣾⣿⠀⢰⠇⠀⢸⣧         ",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⠿⠿⠿⠃⢠⠋⢠⠀⢸⣿⡇        ",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣭⣤⣤⣤⣤⠀⠀⠁⢰⣿⡀⢸⣿⣿        ",
        "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⠟⠁⠀⢀⠀⣸⣿⡇⣿⣿⡇        ",
        "⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⣿⣿⣿⣭⠉⠁⠀⢀⣴⣿⠀⣿⣿⣿⣿⡟         ",
        "⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⣿⣿⡿⠛⠁⣀⣤⠀⣿⣿⣿⣸⣿⣿⣿⠏          ",
        "⠀⠀⠀⣀⣤⣾⣿⣿⣿⣿⣟⣩⣤⣶⣿⣿⣿⣰⣿⣿⣿⣿⠿⠋⠁           ",
        "⠀⠲⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠟⠋⠁              ",
        "⠀⠀⠀⠀⠈⠉⠉⠛⠛⠛⠛⠛⠛⠉                      ",
        "",
        "For the Glory of Mankind",
        "",
    },
    buttons = {
        { txt = "  Find File", keys = "ff", cmd = "Telescope find_files" },
        { txt = "  Recent Files", keys = "fo", cmd = "Telescope oldfiles" },
        { txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep" },
        { txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },
    },
}

return M
