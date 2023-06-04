if status is-interactive
    set fish_greeting ""
end

alias ol 'psql -c "\l" | grep "odoo" | cut -d "|" -f 1 | xargs'
alias oi odoo-init
alias od odoo-del
alias os odoo-run
alias oe odoo-edit

