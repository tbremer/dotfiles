atom.commands.add(
  'atom-workspace',
  'theme:invert',
  function inverter() {
    const reg = /light/;
    const active = atom.themes.getActiveThemeNames();
    const newValue = active.map(val => {
      if (reg.test(val)) {
        return val.replace(reg, 'dark');
      }

      return val.replace('dark', 'light');
    });

    atom.notifications.addInfo('Switching theme…');
    atom.config.set('core.themes', newValue);
  }
);

try {
  const less = window.require('less');
  const el = document.createElement('style');
  const path = require('path').resolve(__dirname, 'styles.less');

  require('fs').readFile(path, (err, data) => {
    if (err) throw err;

    less.render(data.toString(), (err, css) => {
      if (err) throw err;

      console.log('renderer')

      el.setAttribute('source-path', path);
      el.setAttribute('priority', '2');

      el.appendChild(document.createTextNode(css));

      document.querySelector('atom-styles').appendChild(el);
    })

  });
}
catch (err) {
  console.warn('Error loading stylesheet');
  console.error(err);
}
