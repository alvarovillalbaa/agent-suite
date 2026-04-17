#!/usr/bin/env python3
"""Validate required capabilities for code-slides decks."""

from __future__ import annotations

import argparse
from pathlib import Path

HTML_REQUIRED_FILES = ["index.html", "remote.html", "styles.css", "deck.js"]
REACT_REQUIRED_FILES = [
    "src/components/SlideDeck.tsx",
    "src/components/RemoteControl.tsx",
    "src/lib/remote.ts",
    "src/styles/slide-deck.css",
]

REQUIRED_REMOTE_COMMANDS = ["next", "prev", "goto"]


class ValidationError(Exception):
    pass


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Validate a code-slides deck")
    parser.add_argument("--project-root", required=True)
    parser.add_argument("--mode", choices=["html", "react-ts"], required=True)
    return parser.parse_args()


def read_text(path: Path) -> str:
    try:
        return path.read_text(encoding="utf-8")
    except FileNotFoundError as exc:
        raise ValidationError(f"Missing file: {path}") from exc


def assert_contains(content: str, needle: str, message: str) -> None:
    if needle not in content:
        raise ValidationError(message)


def validate_required_files(root: Path, required_files: list[str]) -> None:
    missing = [entry for entry in required_files if not (root / entry).exists()]
    if missing:
        raise ValidationError(f"Missing required files: {', '.join(missing)}")


def validate_no_placeholders(root: Path) -> None:
    placeholders = []
    for path in root.rglob("*"):
        if not path.is_file() or path.suffix.lower() not in {".html", ".css", ".js", ".ts", ".tsx"}:
            continue
        content = path.read_text(encoding="utf-8")
        if "__" in content and "__DECK_" in content:
            placeholders.append(str(path))
    if placeholders:
        raise ValidationError("Unreplaced template placeholders found: " + ", ".join(placeholders))


def validate_html(root: Path) -> None:
    validate_required_files(root, HTML_REQUIRED_FILES)

    index_html = read_text(root / "index.html")
    styles_css = read_text(root / "styles.css")
    deck_js = read_text(root / "deck.js")

    assert_contains(index_html, "iframe", "HTML mode must render slides in an iframe.")
    assert_contains(styles_css, ".nav-right", "Missing .nav-right styles.")
    assert_contains(styles_css, ".nav-bottom", "Missing .nav-bottom styles.")
    assert_contains(deck_js, "BroadcastChannel", "Remote fallback must include BroadcastChannel.")

    for command in REQUIRED_REMOTE_COMMANDS:
        assert_contains(deck_js, f'"{command}"', f'Missing remote command "{command}" in deck.js.')

    if "@media" not in styles_css and "clamp(" not in styles_css:
        raise ValidationError("Responsive rules are missing (need @media and/or clamp).")


def validate_react(root: Path) -> None:
    validate_required_files(root, REACT_REQUIRED_FILES)

    slide_deck = read_text(root / "src/components/SlideDeck.tsx")
    remote_control = read_text(root / "src/components/RemoteControl.tsx")
    remote_lib = read_text(root / "src/lib/remote.ts")
    styles = read_text(root / "src/styles/slide-deck.css")

    assert_contains(slide_deck, "navPosition", "SlideDeck must support navPosition configuration.")
    assert_contains(remote_control, "next", "RemoteControl must include next command control.")
    assert_contains(remote_lib, "BroadcastChannel", "Remote fallback must include BroadcastChannel.")

    for command in REQUIRED_REMOTE_COMMANDS:
        assert_contains(remote_lib, command, f'Missing remote command "{command}" in remote transport.')

    if "@media" not in styles and "clamp(" not in styles:
        raise ValidationError("Responsive rules are missing (need @media and/or clamp).")


def main() -> int:
    args = parse_args()
    root = Path(args.project_root).resolve()

    if not root.exists() or not root.is_dir():
        raise SystemExit(f"Invalid --project-root: {root}")

    try:
        validate_no_placeholders(root)
        if args.mode == "html":
            validate_html(root)
        else:
            validate_react(root)
    except ValidationError as exc:
        print(f"Validation failed: {exc}")
        return 1

    print("Validation passed.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
