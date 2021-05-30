local utils = import 'utils.libsonnet';

local addPrePost(trigger, pre, post) =
    pre + trigger + post
;

{
    PARENT: "default",
    PRE: ":",
    POST: " ",

    LATIN_ALPHABET_LENGTH: 25,

    processFilename: utils.processFilename,
    generateUnicodeArray: utils.generateUnicodeArray,

    processTriggers(rawMatches, pre, post): [
        # Function that adds the specified pre/post triggers the triggers of
        # a matches array
        match + {
            [if "triggers" in match then "triggers"]:
                [
                    addPrePost(trigger, pre, post)

                    for trigger in match["triggers"]
                ],

            [if "trigger" in match then "trigger"]: addPrePost(match["trigger"], pre, post),
        }
        for match in rawMatches
    ],

    processExtras(rawMatches, extras): [
        # Function that adds extra fields to an array of matches
        # extras should be an array of the attributes to add to each match
        match + {
            [extra]: extras[extra]
            for extra in std.objectFields(extras)
        }
        for match in rawMatches
    ],
}
