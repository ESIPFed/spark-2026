# Maintaining the Spark@AGU 2026 site

## Site phases

`cookiecutter.yaml` has one switch, `event_phase`, with two values:

| `event_phase` | The page is in… |
| --- | --- |
| `cfp` | **Call-for-speakers mode.** Recruiting copy after the About section, the agenda is a "blank on purpose" placeholder, the Speakers section shows *last year's* lineup ("Last year's Sparks"), the hero points at the call, and the countdown targets the application deadline. |
| `lineup` | **Normal event mode.** Speaker grid, real agenda, event countdown — exactly what the site looked like before CFP mode was added. |

Nothing was deleted to build CFP mode. Every lineup-mode section still lives in
`{{ cookiecutter.repo_directory }}/index.html`, wrapped in
`{% if cookiecutter.event_phase == "lineup" %}`. Flipping the switch brings it all back.

## Flipping back to lineup mode (November)

1. Fill in the 2026 speakers in `speakers/` — one file per speaker (copy `speakers/template.yaml`). The build regenerates `speakers/speakers.yaml`.
2. Fill in real times in `schedule.yaml` (replace the remaining `TBD` slots; add the talk titles and `leads`).
3. `event_date` is already set in `cookiecutter.yaml` (`banner.event_date` / `banner.event_time`) — confirm it's still right.
4. Change `event_phase: cfp` → `event_phase: lineup` in `cookiecutter.yaml`.
5. Push. The CFP section, the "Last year's Sparks" block, and the blank-agenda copy all disappear; the speaker grid, the real agenda, and the event countdown all return.

If flipping back takes more than these five steps, something is wrong with the implementation.

## Call-for-speakers settings

While `event_phase: cfp`, the `cfp:` block in `cookiecutter.yaml` supplies:

- `apply_url` — the Google Form. Every "Apply" link opens it in a new tab.
- `deadline` — human text, e.g. `"at midnight ET on October 19, 2026"`. If unset or `"TODO"`, the "Applications close…" sentence is dropped (the Apply button still shows).
- `deadline_iso` — the countdown target, e.g. `"2026-10-20T00:00:00-04:00"`. If unset or `"TODO"`, the countdown is hidden instead of rendering `NaN`.

## Last year's speakers

`past-speakers.yaml` (repo root) holds the 2025 lineup shown in CFP mode. Same schema as
`speakers/speakers.yaml`, plus a `playlist_url`. It is only read when `event_phase: cfp`.
