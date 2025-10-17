function sysupdate
    set LOGFILE "$HOME/system_update_$(date '+%Y-%m-%d_%H-%M-%S').log"

    # Кольори
    set COLOR_RESET (set_color normal)
    set COLOR_INFO (set_color cyan)
    set COLOR_OK (set_color green)
    set COLOR_WARN (set_color yellow)
    set COLOR_ERR (set_color red)

    clear
    echo "$COLOR_INFO=== [$(date '+%Y-%m-%d %H:%M:%S')] Початок перевірки оновлень ===$COLOR_RESET" | tee -a $LOGFILE

    echo "$COLOR_INFO=== Очищаю кеш DNF від мотлоху... ===$COLOR_RESET" | tee -a $LOGFILE
    sudo dnf clean all | tee -a $LOGFILE

    echo "$COLOR_INFO=== Перевіряю наявність оновлень... ===$COLOR_RESET" | tee -a $LOGFILE
    sudo dnf check-update | tee -a $LOGFILE

    read -l -P "Бажаєш встановити всі оновлення зараз? (y/N): " confirm
    if test "$confirm" = "y"
        echo "$COLOR_WARN=== Встановлюю оновлення... ===$COLOR_RESET" | tee -a $LOGFILE
        sudo dnf upgrade -y | tee -a $LOGFILE

        echo "$COLOR_OK=== [$(date '+%Y-%m-%d %H:%M:%S')] Оновлення завершено ===$COLOR_RESET" | tee -a $LOGFILE
        read -l -P "Перезавантажити систему зараз? (y/N): " reboot_confirm
        if test "$reboot_confirm" = "y"
            echo "$COLOR_WARN=== Перезавантаження системи... ===$COLOR_RESET" | tee -a $LOGFILE
            sudo reboot
        else
            echo "$COLOR_INFO=== Перезавантаження відкладено. ===$COLOR_RESET" | tee -a $LOGFILE
        end
    else
        echo "$COLOR_WARN=== Оновлення відкладено користувачем. ===$COLOR_RESET" | tee -a $LOGFILE
    end

    echo "$COLOR_INFO=== Лог збережено у: ===$COLOR_RESET $LOGFILE"
end

