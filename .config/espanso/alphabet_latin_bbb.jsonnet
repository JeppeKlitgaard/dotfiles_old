local g = import 'base.libsonnet';

local normal_lower = g.generateUnicodeArray("a", g.LATIN_ALPHABET_LENGTH);
local normal_upper = g.generateUnicodeArray("A", g.LATIN_ALPHABET_LENGTH);

local bb_lower = g.generateUnicodeArray("𝕒", g.LATIN_ALPHABET_LENGTH);
local bb_upper = g.generateUnicodeArray("𝔸", g.LATIN_ALPHABET_LENGTH);
# bb_upper needs some manual fixing due to common math BB being defined in
# different codepoint range
local bb_upper[2] = "ℂ",

local rawMatches = [],
// local rawMatches = [
//   {
//     triggers: [
//       'trigger1',
//       'trigger2',
//     ],
//     replace: 'replacement',
//   },
// ];

local rawMatches = [
  std.range(1, 10)
],

std.manifestYamlDoc(
  {
    name: g.processFilename(std.thisFile),
    parent: g.PARENT,

    matches: g.processTriggers(rawMatches, g.PRE, g.POST),
  }
)
