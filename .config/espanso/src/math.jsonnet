local g = import 'lib/base.libsonnet';

local rawMatches = [
  ### Operators
  {
    triggers: ['pm', '+-'],
    replace: '±',
  },
  {
    triggers: ['mp', '-+'],
    replace: '∓',
  },

  #
  {
    triggers: ['cdot', '.'],
    replace: '⋅',
  },
  {
    triggers: ['Cdot', '*'],
    replace: '∙',
  },

  #
  {
    triggers: ['ring','o'],
    replace: '∘',
  },
  {
    triggers: ['Ring','O'],
    replace: '〇',
  },

  {
    triggers: ['star'],
    replace: '∗',
  },

  #
  {
    triggers: ['cross','multiplication','mult','x'],
    replace: '×',
  },
  {
    triggers: ['division','div','%', '-:'],
    replace: '÷',
  },

  #
  {
    triggers: ['prod','PI',],
    replace: '∏',
  },
  {
    triggers: ['coprod'],
    replace: '∐',
  },
  {
    triggers: ['sum'],
    replace: '∑',
  },

  #
  {
    triggers: ['dagger','dag','hermitian','herm','h'],
    replace: '†',
  },
  {
    triggers: ['ddagger','ddag'],
    replace: '‡',
  },


  # Roots
  {
    triggers: ['sqrt','2rt','root'],
    replace: '√',
  },
  {
    triggers: ['cbrt','3rt'],
    replace: '∛',
  },
  {
    triggers: ['4rt'],
    replace: '∜',
  },

  ### Logic
  {
    triggers: ['and'],
    replace: '∧',
  },
  {
    triggers: ['or'],
    replace: '∨',
  },

  {
    triggers: ['neg','!'],
    replace: '¬',
  },
  {
    triggers: ['Neg','!!'],
    replace: '￢',
  },

  {
    triggers: ['true','t'],
    replace: '〒',
  },
  {
    triggers: ['True','T'],
    replace: '┳',
  },
  {
    triggers: ['false','f'],
    replace: '⊥',
  },
  {
    triggers: ['False','F'],
    replace: '┻',
  },

  ### Denominators
  {
    triggers: ['permille','%0'],
    replace: '‰',
  },
  {
    triggers: ['per10k','%00'],
    replace: '‱',
  },

  ### Comparators
  {
    triggers: ['neq','=/'],
    replace: '≠',
  },

  # Approx
  {
    triggers: ['approx','a','~~'],
    replace: '≈',
  },
  {
    triggers: ['~'],
    replace: '∼',
  },
  {
    trigger: ',?-',
    replace: '≃',
  },
  {
    trigger: ',?=',
    replace: '≅',
  },

  {
    triggers: ['>=','geq'],
    replace: '≥',
  },
  {
    triggers: ['<=','leq'],
    replace: '≤',
  },

  ### Symbols
  {
    triggers: ['i','inf','infty'],
    replace: '∞',
  },

  {
    triggers: ['angle','<'],
    replace: '∠',
  },
  {
    triggers: ['rangle'],
    replace: '∟',
  },
  {
    triggers: ['mangle'],
    replace: '∡',
  },
  {
    triggers: ['sangle'],
    replace: '∢',
  },

  ### Shapes
  {
    triggers: ['tangle', 'triangle'],
    replace: '⊿',
  },
  {
    triggers: ['sq', 'square'],
    replace: '◻',
  },


  ### Proof
  {
    triggers: ['qed','halmos','tomb','tombstone'],
    replace: '∎',
  },
  {
    triggers: ['contra','lightning','bolt'],
    replace: '↯',
  },
  {
    triggers: ['vcontra', '::x'],
    replace: '※',
  },


  ### Reading help
  {
    triggers: ['bourbaki','danger','bend'],
    replace: '☡',
  },

  ### Text Logic
  {
    triggers: ['forall','fa'],
    replace: '∀',
  },

  {
    triggers: ['thereexists','exists','te'],
    replace: '∃',
  },
  {
    triggers: ['!thereexists','!exists','!te'],
    replace: '∄',
  },

  {
    triggers: ['therefore','thus','tf','t4',':.'],
    replace: '∴',
  },
  {
    triggers: ['because','bc','.:'],
    replace: '∵',
  },
  {
    triggers: ['ratio'],
    replace: '∶',
  },
  {
    triggers: ['proportion','prop',': '],
    replace: '∷',
  },

  ### Set and Group
  {
    triggers: ['emptyset','empty','O/'],
    replace: '∅',
  },

  {
    triggers: ['in'],
    replace: '∈',
  },
  {
    triggers: ['!in'],
    replace: '∉',
  },

  {
    triggers: ['contains','ni'],
    replace: '∋',
  },
  {
    triggers: ['!contains','!ni'],
    replace: '∌',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
