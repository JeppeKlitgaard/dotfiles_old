local g = import 'lib/base.libsonnet';

local rawMatches = [
  ### Degree/angle
  {
    triggers: [
      'deg',
      '^o',
    ],
    replace: '°',
  },

  # Temperature
  {
    triggers: [
      'degc',
      '^oc',
    ],
    replace: '℃',
  },
  {
    triggers: [
      'degf',
      '^of',
    ],
    replace: '℉',
  },

  # Angle
  {
    triggers: [
      'rad',
      '^c',
    ],
    replace: 'ᶜ',
  },
  {
    triggers: [
      'urad',
    ],
    replace: '㎭',
  },

  {
    triggers: [
      'grad',
      '^g',
    ],
    replace: 'ᵍ',
  },
];

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
