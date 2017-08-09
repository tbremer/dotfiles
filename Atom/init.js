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
  const resolve = require('path').resolve;
  const path = resolve(__dirname, 'styles.less');
  const variablesPath = resolve(process.resourcesPath, 'app', 'static', 'variables');
  const options = {
    paths: [ variablesPath ]
  };

  require('fs').readFile(path, (err, data) => {
    if (err) throw err;

    less.render(data.toString(), options, (err, css) => {
      if (err) throw err;

      el.setAttribute('source-path', path);
      el.setAttribute('priority', '2');

      el.appendChild(document.createTextNode(css.css));

      document.querySelector('atom-styles').appendChild(el);
    })

  });
}
catch (err) {
  console.warn('Error loading stylesheet');
  console.error(err);
}
