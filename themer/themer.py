#!/usr/bin/env python3

import sys
import configparser
import argparse

from argparse import ArgumentParser, Namespace
from string import Template


def parse_arguments() -> Namespace:
    parser: ArgumentParser = argparse.ArgumentParser()

    _ = parser.add_argument("--config", action="store", required=True, type=str)
    _ = parser.add_argument("--theme", action="store", required=True, type=str)
    _ = parser.add_argument("--print", action="store_true", required=False)

    return parser.parse_args()


class ThemeAdapter:

    _DEFAULT_THEME_FIELDS: list[str] = [
        "primary",
        "secondary",
        "tertiary",
        "foreground",
        "error",
        "wallpaper",
        "font",
    ]
    _DEFAULT_THEME_PREFIX: str = "theme-"

    _TEMPLATE_FIELD: str = "template"
    _OUTPUT_FIELD: str = "output"

    _REQUIRED_FIELDS: set[str] = {_TEMPLATE_FIELD, _OUTPUT_FIELD}

    def __init__(self, filename: str, theme: str) -> None:
        self._config = configparser.RawConfigParser()
        try:
            if not self._config.read(filename):
                raise FileNotFoundError(f"Configuration file not found: '{filename}'")
        except OSError as e:
            raise e
        self._theme = theme
        try:
            default_keys: list[str] = [key for key in self._get_theme_section()]
            if default_keys != self._DEFAULT_THEME_FIELDS:
                raise ValueError(
                    f"Expected theme field(s) in 'theme-{theme}' section: {", ".join(self._DEFAULT_THEME_FIELDS)}"
                )
        except configparser.NoSectionError:
            raise ValueError(
                f"No theme section found: '{self._DEFAULT_THEME_PREFIX}{self._theme}'"
            )

    @property
    def sections(self) -> list[tuple[str, str, str]]:
        return self._render_sections()

    def _render_sections(self) -> list[tuple[str, str, str]]:
        sections: list[tuple[str, str, str]] = []
        for section in self._config.sections():
            if section.startswith(self._DEFAULT_THEME_PREFIX):
                continue

            try:
                output: str = self._render_section(section)
            except Exception as e:
                raise e

            sections.append(
                (section, self._get_section(section)[self._OUTPUT_FIELD], output)
            )

        return sections

    def _render_section(self, section: str) -> str:
        missing_fields: set[str] = (
            self._REQUIRED_FIELDS - self._get_section(section).keys()
        )
        if missing_fields:
            raise ValueError(
                f"Missing field(s) in section '{section}': {', '.join(missing_fields)}"
            )

        template: Template = Template(self._get_section(section)[self._TEMPLATE_FIELD])
        output: str = template.safe_substitute(
            {key: value for key, value in self._get_theme_section().items()}
        )
        output = Template(output).safe_substitute({'hash': '#'})


        return output

    def _get_section(self, section: str) -> dict[str, str]:
        return dict(self._config.items(section))

    def _get_theme_section(self) -> dict[str, str]:
        return self._get_section(section=f"{self._DEFAULT_THEME_PREFIX}{self._theme}")


def main(args: Namespace) -> None:
    try:
        sections: list[tuple[str, str, str]] = ThemeAdapter(
            args.config, args.theme
        ).sections
    except Exception as e:
        print(e)
        sys.exit(1)

    for section, filename, output in sections:
        if args.print:
            print(f"\n[{section}] {filename}\n{output}")
        else:
            with open(filename, "w") as file:
                file.write(output)


if __name__ == "__main__":
    main(parse_arguments())
