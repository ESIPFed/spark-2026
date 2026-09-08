# Spark Speakers Directory

This directory contains YAML files for individual Spark@AGU speakers.

## Adding a New Speaker

Create a new YAML file in this directory following the template in `template.yaml`:

```yaml
- title: Speaker Name
  avatar: https://avatars.githubusercontent.com/username
  role: Speaker Title/Affiliation
  organizations:
    - name: Organization Name
      url: https://organization-url.com/
  bio: |
    A brief biography about the speaker and their work.
  expertise:
    - Topic 1
    - Topic 2
  social:
    - icon: github
      link: https://github.com/username
  user_groups:
    - Spark Presenter
```

## Build Process

The build script will automatically consolidate all speaker YAML files (except `header.yaml`, `template.yaml`, `README.md`, and `speakers.yaml`) into `speakers.yaml`.
