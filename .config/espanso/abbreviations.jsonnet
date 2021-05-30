local g = import 'base.libsonnet';

local rawMatches = [
  {
    trigger: 'iff',
    replace: 'if and only if',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
