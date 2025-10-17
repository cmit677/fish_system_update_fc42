<h1>Документація до використання: <code>sysupdate.fish</code> та <code>up.fish</code></h1>
  
  <h2>Для чого це?</h2>
    <p>Для зручності оновлення системи натисканням лише двох кнопок: <code>up</code></p>
    
  <section>
    <h2>1. Призначення</h2>
    <p>
      Скрипт <code>sysupdate.fish</code> — це функція для автоматизованого оновлення системи Fedora або інших дистрибутивів на базі DNF.
      Він очищає кеш, перевіряє наявність оновлень, пропонує їх встановити та створює лог-файл процесу з можливістю перезавантаження системи.
      Створений за допомогою AI та використовується постійно на ОС Fedora 42 Cinnamon.
    </p>
    <p>
      Скрипт <code>up.fish</code> — короткий виклик (обгортка) для запуску <code>sysupdate</code>. Він просто виводить повідомлення
      і запускає головну функцію оновлення.
    </p>

   <h3>Основні дії:</h3>
    <ol>
      <li>Очищення кешу DNF: <code>sudo dnf clean all</code></li>
      <li>Перевірка наявності оновлень: <code>sudo dnf check-update</code></li>
      <li>Пропозиція встановити всі оновлення</li>
      <li>Встановлення оновлень: <code>sudo dnf upgrade -y</code></li>
      <li>Пропозиція перезавантажити систему</li>
      <li>Збереження логів у файлі <code>$HOME/system_update_YYYY-MM-DD_HH-MM-SS.log</code></li>
    </ol>
  </section>

  <section>
    <h2>2. Локальне встановлення</h2>
    <p>Для встановлення функцій лише для поточного користувача:</p>
    <ol>
      <li>Створити директорію для власних функцій (якщо її ще немає):<br>
        <code>mkdir -p ~/.config/fish/functions</code>
      </li>
      <li>Скопіювати скрипти у цю директорію:<br>
        <code>cp sysupdate.fish ~/.config/fish/functions/</code><br>
        <code>cp up.fish ~/.config/fish/functions/</code>
      </li>
      <li>Перезапусти shell або ввести:<br>
        <code>exec fish</code>
      </li>
      <li>Перевірити роботу:<br>
        <code>up</code> або <code>sysupdate</code>
      </li>
    </ol>
  </section>

  <section>
    <h2>3. Системне встановлення</h2>
    <p>Щоб зробити функції доступними для всіх користувачів системи:</p>
    <ol>
      <li>Скопіювати скрипти у системну директорію функцій:<br>
        <code>sudo cp sysupdate.fish /usr/share/fish/functions/</code><br>
        <code>sudo cp up.fish /usr/share/fish/functions/</code>
      </li>
      <li>Перевірити права доступу:<br>
        <code>sudo chmod 644 /usr/share/fish/functions/sysupdate.fish</code><br>
        <code>sudo chmod 644 /usr/share/fish/functions/up.fish</code>
      </li>
      <li>Оновити shell:<br>
        <code>exec fish</code>
      </li>
    </ol>
  </section>

  <section>
    <h2>4. Створення документації (man-сторінок)</h2>
    <p>Для кожної функції створюються окремі файли <code>sysupdate.1</code> і <code>up.1</code>.</p>
    <h3>Кроки:</h3>
    <ol>
      <li>Створити директорію для користувацьких man-сторінок:<br>
        <code>mkdir -p ~/.local/share/man/man1</code>
      </li>
      <li>Скопіювати файли:<br>
        <code>cp ~/.local/share/man/man1/sysupdate.1</code><br>
        <code>cp ~/.local/share/man/man1/up.1</code>
      </li>
    </ol>
    <h3>Оновлення бази man:</h3>
    <pre><code>mandb ~/.local/share/man</code></pre>

   <p>
      Після виконання цих кроків команди <code>sysupdate</code> та <code>up</code> матимуть
      власну офіційну документацію, доступну через <code>man</code>.
    </p>
    <p>Після цього можна перевірити:</p>
    <pre><code>man sysupdate</code></pre>
    <pre><code>man up</code></pre>
  </section>

  <section>
    <h2>5. Додавання шляху до MANPATH</h2>
    <p>
      Якщо команда <code>man</code> не знаходить локальні сторінки, потрібно додати шлях <code>~/.local/share/man</code>
      до змінної <code>MANPATH</code>.
    </p>
    <h3>Для Fish:</h3>
    <pre><code>set -x MANPATH $HOME/.local/share/man $MANPATH</code></pre>
    <p>Після цього перезапусти shell:</p>
    <pre><code>exec fish</code></pre>
  </section>

  <section>
    <p>
      Після виконання всіх кроків оновлення системи виконується у терміналі з оболонкою Fish:
    </p>
    <ul>
      <li>Командою <code>up</code>, яка працює у будь-якій сесії Fish;</li>
      <li>Автоматичне логування оновлень у домашню директорію;</li>
      <li>Опцію перезавантаження системи після оновлення;</li>
      <li>Локальні man-сторінки, доступні через <code>man sysupdate</code> та <code>man up</code>.</li>
    </ul>

  </section>
  
  <section>
    <p> 
      Приємного використання!
    </p>
  </section>
  <img width="660" height="450" alt="fish_update_fc42" src="https://github.com/user-attachments/assets/3f55d69e-5724-4e46-be90-3ad18d09790c" />
