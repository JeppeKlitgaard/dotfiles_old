# Fix wsl-interop
# See: https://github.com/microsoft/WSL/issues/5065

# fix_wsl2_interop() {
#     for i in $(pstree -np -s $$ | grep -o -E '[0-9]+'); do
#         if [[ -e "/run/WSL/${i}_interop" ]]; then
#             export WSL_INTEROP=/run/WSL/${i}_interop
#         fi
#     done
# }

function fix_wsl2_interop
    for i in (pstree -np -s $fish_pid | grep -o -E '[0-9]+')
        if test -e "/run/WSL/"$i"_interop"
            set -x WSL_INTEROP "/run/WSL/"$i"_interop"
        end
    end
end

fix_wsl2_interop