local g = import '../lib/base.libsonnet';
local m = import '../lib/modifiers.libsonnet';

local rawMatches = [
  # Punctuation
  {
    trigger: '?',
    replace: '¿',
  },
  {
    trigger: '!',
    replace: '¡',
  },
  {
    triggers: ['?!','!?'],
    replace: '‽',
  },

  # Marks
  {
    trigger: 'tm',
    replace: '™',
  },
  {
    trigger: 'cr',
    replace: '©',
  },

  # Hbar
  {
    trigger: 'hbar',
    replace: 'ℏ',
  },

  # Fancy E
  {
    triggers: ['euler','e'],
    replace: '𝑒',
  },

  # Fancy L
  {
    triggers: ['ell','l'],
    replace: 'ℓ',
  },
  {
    triggers: ['Ell','L'],
    replace: 'ℒ',
  },

  # Fancy plus
  {
    trigger: '+',
    replace: '✠',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
