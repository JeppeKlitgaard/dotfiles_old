local g = import 'lib/base.libsonnet';

local dateFmt = '%F';  # ISO 8601 Date
local datetimeFmt = '%Y-%m-%dT%H:%M:%S%#z';  # ISO 8601 Date

local rawMatches = [
  {
    triggers: [
      'isod',
      'isodate',
    ],
    replace: '{{isodate}}',
    vars: [
      {
        name: 'isodate',
        type: 'date',
        params: {
          format: dateFmt,
        }
      }
    ],
  },

  {
    triggers: [
      'isodt',
      'isodatetime',
    ],
    replace: '{{isodatetime}}',
    vars: [
      {
        name: 'isodatetime',
        type: 'date',
        params: {
          format: datetimeFmt,
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