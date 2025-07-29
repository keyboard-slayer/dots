local function get_links(content)
    local links = {}
    for link in string.gmatch(content, "https?://[%w%-%._~:/%?#@!$&%'%(%)%*%+,%%=]*[%w%/_~#=]") do
        table.insert(links, link)
    end

    return links
end

local function open_picker(links)
    local command

    if vim.loop.os_uname().sysname == "Linux" then
        command = "xdg-open "
    elseif vim.loop.os_uname().sysname == "Darwin" then
        command = "open "
    end

    if #links == 1 then
        vim.fn.jobstart(command .. links[1])
    else
        MiniPick.start({
            source = {
                items = links,
                choose = function(item)
                    vim.fn.jobstart(command .. item)
                end
            }
        })
    end
end

local function open_link()
    vim.cmd('call setreg("v", [])')
    vim.cmd('noau normal! "vy"')
    local content = vim.fn.getreg('v')

    if content:len() > 0 then
        local links = get_links(content)
        print(vim.inspect(links))

        if #links > 0 then
            open_picker(links)
            return
        end

        return
    end

    content = vim.api.nvim_get_current_line()
    local links = get_links(content)

    if #links > 0 then
        open_picker(links)
        return
    end

    content = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), " ")
    links = get_links(content)

    if #links > 0 then
        open_picker(links)
    end
end

vim.keymap.set({ "n", "v" }, "<leader>o", open_link)
