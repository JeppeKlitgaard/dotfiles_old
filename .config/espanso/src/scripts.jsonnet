local g = import 'lib/base.libsonnet';

local scriptLocation = '~/.config/espanso/compile.fish';

local rawMatches = [
  {
    trigger: 'compileJsonnet',
    replace: '{{output}}',
    vars: [
      {
        name: 'output',
        type: 'script',
        params: {
          args: [
            'wsl',
            'fish',
            scriptLocation,
          ],
        }
      }
    ],
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
