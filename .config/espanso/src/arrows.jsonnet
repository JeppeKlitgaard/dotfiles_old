local g = import 'lib/base.libsonnet';

local rawMatches = [
  # Single arrows
  {
    triggers: [
      'la',
      'leftarrow',
      '<--',
    ],
    replace: '←',
  },
  {
    triggers: [
      'las',
      'leftarrowstroke',
      '<-/-',
    ],
    replace: '↚',
  },

  {
    triggers: [
      'ra',
      'rightarrow',
      '-->',
    ],
    replace: '→',
  },
  {
    triggers: [
      'ras',
      'rightarrowstroke',
      '-/->',
    ],
    replace: '↛',
  },

  {
    triggers: [
      'lra',
      'leftrightarrow',
      '<-->',
    ],
    replace: '↔',
  },
  {
    triggers: [
      'lras',
      'leftrightarrowstroke',
      '<-/->',
    ],
    replace: '↮',
  },

  {
    triggers: [
      'ua',
      'uparrow',
    ],
    replace: '↑',
  },

  {
    triggers: [
      'da',
      'downarrow',
    ],
    replace: '↓',
  },

  {
    triggers: [
      'uda',
      'updownarrow',
    ],
    replace: '↕',
  },

  # Double arrows
  {
    triggers: [
      'La',
      'Leftarrow',
      '<==',
    ],
    replace: '⇐',
  },
  {
    triggers: [
      'Las',
      'Leftarrowstroke',
      '<=/=',
    ],
    replace: '⇍',
  },

  {
    triggers: [
      'Ra',
      'Rightarrow',
      '==>',
    ],
    replace: '⇒',
  },
  {
    triggers: [
      'Ras',
      'Rightarrowstroke',
      '=/=>',
    ],
    replace: '⇏',
  },

  {
    triggers: [
      'Lra',
      'Leftrightarrow',
      '<==>',
      '=',
    ],
    replace: '⇔',
  },
  {
    triggers: [
      'Lras',
      'Leftrightarrowstroke',
      '<=/=>',
    ],
    replace: '⇎',
  },

  {
    triggers: [
      'Ua',
      'Uparrow',
    ],
    replace: '⇑',
  },

  {
    triggers: [
      'Da',
      'Downarrow',
    ],
    replace: '⇓',
  },

  {
    triggers: [
      'Uda',
      'Updownarrow',
    ],
    replace: '⇕',
  },

  # Long single arrows
  {
    triggers: [
      'Lla',
      'longleftarrow',
      '<---'
    ],
    replace: '⟵',
  },
  {
    triggers: [
      'Lra',
      'longrightarrow',
      '--->'
    ],
    replace: '⟶',
  },
  {
    triggers: [
      'Llra',
      'longleftrightarrow',
      '<--->'
    ],
    replace: '⟷',
  },

  # Long double arrows
  {
    triggers: [
      'LLa',
      'longLeftarrow',
      '<==='
    ],
    replace: '⟸',
  },
  {
    triggers: [
      'LRa',
      'longRightarrow',
      '===>'
    ],
    replace: '⟹',
  },
  {
    triggers: [
      'LLra',
      'longLeftrightarrow',
      '<===>',
      'iff'
    ],
    replace: '⟺',
  },

  # Harpoon arrows
  {
    triggers: [
      'Lh',
      'Leftharpoon',
    ],
    replace: '↼',
  },
  {
    triggers: [
      'lh',
      'leftharpoon',
    ],
    replace: '↽',
  },

  {
    triggers: [
      'Rh',
      'Rightharpoon',
    ],
    replace: '⇀',
  },
  {
    triggers: [
      'rh',
      'rightharpoon',
    ],
    replace: '⇁',
  },

  {
    triggers: [
      'Dh',
      'Downharpoon',
    ],
    replace: '⇃',
  },
  {
    triggers: [
      'dh',
      'downharpoon',
    ],
    replace: '⇂',
  },

  {
    triggers: [
      'Uh',
      'Upharpoon',
    ],
    replace: '↿',
  },
  {
    triggers: [
      'uh',
      'upharpoon',
    ],
    replace: '↾',
  },

  {
    triggers: [
      'lrh',
      'leftrightharpoon',
    ],
    replace: '⇋',
  },
  {
    triggers: [
      'rlh',
      'rightleftharpoon',
    ],
    replace: '⇌',
  },

  {
    triggers: [
      'udh',
      'updownharpoon',
    ],
    replace: '⥮',
  },
  {
    triggers: [
      'duh',
      'downupharpoon',
    ],
    replace: '⥯',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
