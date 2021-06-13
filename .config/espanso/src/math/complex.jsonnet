local g = import '../lib/base.libsonnet';

local rawMatches = [
  # Real and imaginary parts of
  {
    triggers: ['Re', 're'],
    replace: 'ℜ',
  },
  {
    triggers: ['Im', 'im'],
    replace: 'ℑ',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
