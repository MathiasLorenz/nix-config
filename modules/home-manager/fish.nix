{ pkgs, ... }:
{
  programs.direnv = {
    enable = true;
    # throws error?
    # enableFishIntegration = true;
  };
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.yazi = {
    enableFishIntegration = true;
    # shellWrapperName = "yy"; # this doesn't seem to work

    # these don't seem to work either
    settings = {
      manager = {
        show_hidden = true;
      };
      preview = {
        max_width = 1000;
        max_height = 1000;
      };
    };
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableTransience = true;
  };

  programs.fish = {
    enable = true;
    generateCompletions = true;

    interactiveShellInit = ''
      set fish_greeting # Disable greeting

      # add wrapper function for launching yazi
      function yy
      	set tmp (mktemp -t "yazi-cwd.XXXXXX")
      	yazi $argv --cwd-file="$tmp"
      	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
      		builtin cd -- "$cwd"
      	end
      	rm -f -- "$tmp"
      end

      # set default applications
      set -x EDITOR "nvim"
      set -x VISUAL "nvim"
      set -x READER "zathura"
      set -x TERMINAL "ghostty"
      set -x BROWSER "qutebrowser"
      set -x PAGER "less"

      # Add roc-lang to path - this must be updated on new nightly releases (when downloaded)
      # Is not yet working, maybe just use home-manager sessionVariables...
      # fish_add_path ~/roc_nightly-linux_x86_64-2025-01-07-a089cf2

      # setup ssh-agent and add keys, supress output
      set -x SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
      ssh-add &> /dev/null

      nitch
    '';

    shellAbbrs = {
      # Git
      g = "git";
      gst = "git status";
      gd = "git diff";
      gds = "git diff --staged";
      gc = "git commit";
      gp = "git push";
      gpfwl = "git push --force-with-lease";

      ls = "eza --icons";
      l = "eza --icons --git -alh";
      t = "task";
      k = "kubectl";
      knr = "kubectl describe nodes |grep '^  Resource' -A3";
      n = "nvim";
      lg = "lazygit";
      ncdu = "ncdu --color dark -rr";
      ping = "prettyping --nolegend";
      hm = "home-manager";
      ff = "fastfetch";

      # cat = "bat";
      # docker
      docker_status = "echo -e \"\nContainers:\n\" && docker ps -a && echo -e \"\nImages:\n\" && docker image ls && echo -e \"\nVolumes:\n\" && docker volume ls";
      docker_clean = "docker volume prune -f && docker system prune -f";
      ghre = "gh repo view --web";
      ghpr = "gh pr view --web";
      ghpc = "gh pr create";
      ghpm = "gh pr merge";
    };

    plugins = [
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
      {
        name = "done";
        src = pkgs.fishPlugins.done.src;
      }
      {
        name = "fish-you-should-use";
        src = pkgs.fishPlugins.fish-you-should-use.src;
      }
      {
        name = "colored-man-pages";
        src = pkgs.fishPlugins.colored-man-pages.src;
      }
      {
        name = "plugin-git";
        src = pkgs.fishPlugins.plugin-git.src;
      }
      {
        name = "grc";
        src = pkgs.fishPlugins.grc.src;
      }
      {
        name = "fish-bd";
        src = pkgs.fishPlugins.fish-bd.src;
      }
    ];
  };
}
