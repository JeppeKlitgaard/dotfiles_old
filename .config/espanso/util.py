from __future__ import annotations
from typing import Any
import _jsonnet
import yaml
import ast
from pathlib import Path
import os
from glob import glob
import click
from typing import Any
from pprint import pprint

SRC_PATH = Path("src")
GLOB_PATTERN = str(SRC_PATH / "**" / "*.jsonnet")


class Match:
    triggers: list[str]
    replace: str
    origin: Path

    def __init__(self, triggers: list[str], replace: str, origin: Path):
        self.triggers = triggers
        self.replace = replace
        self.origin = origin

    def __repr__(self) -> str:
        return f"{self.triggers} -> '{self.replace}'"

    @classmethod
    def from_obj(cls, obj: dict[str, Any], origin: Path) -> Match:
        triggers: list[str]

        if "triggers" in obj:
            triggers = obj["triggers"]
        elif "trigger" in obj:
            triggers = [obj["trigger"]]
        else:
            raise ValueError("Invalid obj.")

        return cls(triggers, obj["replace"], origin)


def unescape(str) -> str:
    return ast.literal_eval(str)

def load_jsonnet(path: Path) -> any:
    raw_str = _jsonnet.evaluate_file(str(path))
    yaml_str = unescape(raw_str)
    obj = yaml.safe_load(yaml_str)

    return obj

def path_to_matches(path: Path) -> list[Match]:
    obj = load_jsonnet(path)

    matches = []
    for entry in obj["matches"]:
        matches.append(Match.from_obj(entry, path))

    return matches


def find_duplicates(l: list[any]):
    seen = []
    dupes = set()

    for i in l:
        if i in seen:
            dupes.add(i)
        else:
            seen.append(i)

    return list(dupes)


def get_all_matches() -> list[Match]:
    matches = []

    files = glob(GLOB_PATTERN, recursive=True)
    paths = [Path(x) for x in files]

    for path in paths:
        print(f"Loading {path}")
        # Fixes don't have any matches
        try:
            matches.extend(path_to_matches(path))
        except KeyError:
            print(f"No matches found in {path}")
            continue

    return matches


if __name__ == "__main__":
    @click.group()
    def cli():
        pass

    @click.command()
    def find_dupes():
        matches = get_all_matches()

        # First construct list of all triggers
        triggers = []
        for match in matches:
            triggers.extend(match.triggers)

        dupes = find_duplicates(triggers)

        duped_matches = {}
        for match in matches:
            overlap = [i for i in match.triggers if i in dupes]

            if overlap:
                i = overlap[0]

                if i in duped_matches:
                    duped_matches[i].append(match)
                else:
                    duped_matches[i] = [match]

        print(f"Found {len(duped_matches)} duplicates!")
        for duped_key, ms in duped_matches.items():
            print(f"'{duped_key}' is a duplicate in:")
            for m in ms:
                print(f"- {m.origin}")


    cli.add_command(find_dupes)

    cli()
