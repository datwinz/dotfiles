vim.api.nvim_create_user_command('UpdateAll',
    function ()
        vim.cmd("TSUpdateSync")
        vim.cmd("Mason")
        vim.cmd("Pckr sync")
    end,
    {})
