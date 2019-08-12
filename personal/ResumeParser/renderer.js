const undom = require('undom');
const document = undom();

const empty_elements = [
  'area',
  'base',
  'br',
  'col',
  'embed',
  'hr',
  'img',
  'input',
  'link',
  'meta',
  'param',
  'source',
  'track',
  'wbr',
];

document.Element.prototype.toString = function() {
  console.log('this:', this);
  return serialize(this);
};
let attr = a => ` ${a.name}="${enc(a.value)}"`;
let enc = s => s.replace(/[&'"<>]/g, a => `&#${a};`);
function serialize(el) {
  if (el.nodeType === 3) return enc(el.data);
  if (empty_elements.includes(el.nodeName.toLowerCase())) {
    return '<' + el.nodeName.toLowerCase() + el.attributes.map(attr).join('') + ' />';
  } else
    return (
      '<' +
      el.nodeName.toLowerCase() +
      el.attributes.map(attr).join('') +
      '>' +
      el.childNodes.map(serialize).join('') +
      '</' +
      el.nodeName.toLowerCase() +
      '>'
    );
}

const br = document.createElement('br');

console.log(br.toString());

// function h(name, props, ...children) {}
//
// module.exports = h;
//
// equal(h('a', { href: '/' }, 'Click Me'), '<a href="/">Click Me</a>');
