if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias vi hx
alias vim hx
alias nvim hx
alias z zoxide
alias cat bat
alias ls lsd

alias g git
alias lg lazygit
alias gpc "gh pr checkout"
alias gcp "gh pr checkout"

alias rc "bin/rails c"
alias bd bin/dev

alias snr "HOSTNAME=(hostname) sudo nixos-rebuild switch --flake  /etc/nixos/.#default --impure"

function nix-rebuild
    set HOSTNAME (hostname)

    switch $HOSTNAME
        case carseatheadrest
            sudo nixos-rebuild switch --flake /etc/nixos/.#default --impure
        case pavement
            nix run github:nix-community/home-manager -- switch --flake /home/apereira/Software/dotfiles/nix#apereira
        case '*'
            echo "Unknown hostname: $HOSTNAME"
            echo "Available options:"
            echo "  - carseatheadrest (NixOS)"
            echo "  - pavement (Ubuntu + Home Manager)"
            return 1
    end
end

function ber
    set original_dir (pwd)

    set path $argv[1]
    set extra_args $argv[2..-1]

    if test (string match -r '^decidim-' $path)
        set dir (string split '/' $path)[1]
        set relative_path (string replace -r '^decidim-[^/]+/' '' $path)

        cd $dir
        bundle exec rspec $relative_path $extra_args
        cd $original_dir
    else
        bundle exec rspec $path $extra_args
    end
end

export MANPAGER='sh -c "col -bx | bat -l man -p"'
export MANROFFOPT="-c"
export EDITOR="nvim"

zoxide init fish | source
direnv hook fish | source
