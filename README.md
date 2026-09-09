# Spark@AGU 2026

Welcome to **Spark@AGU 2026**! 🌟

Ready to **spark** conversation? Spark@AGU talks are a dynamic five minutes of exactly 20 auto-advancing slides! This isn't your typical research presentation. Speakers craft engaging visuals and accessible language on any topic they choose. It's quick, bold, and creative – leave the jargon behind!

## About Spark@AGU

Spark@AGU is an innovative presentation format hosted by the [Earth Science Information Partners (ESIP)](https://www.esipfed.org/) in conjunction with the American Geophysical Union (AGU) Fall Meeting. Each speaker has exactly 5 minutes to present their ideas using 20 slides that automatically advance every 15 seconds.

**Event Details:**
- 📅 **When:** Wednesday, December 9, 2026, 6:00–8:30 PM local time
- 📍 **Where:** East Brother Beer Co. Rec Room, 135 4th St, San Francisco, CA 94103
- ⏱️ **Format:** 5-minute presentations with 20 auto-advancing slides
- 🎯 **Goal:** Make science accessible, engaging, and conversation-starting

> **Note:** The speaker lineup and detailed run-of-show times in `schedule.yaml`
> are still TBD.

**What Makes Spark Special:**
- **Fast-paced:** 20 slides × 15 seconds = exactly 5 minutes
- **Accessible:** No jargon - designed for broad audiences
- **Creative:** Visual storytelling over technical details
- **Diverse Topics:** Any subject that sparks curiosity and conversation

Learn more about Spark: https://www.esipfed.org/spark-agu/

### Adding Yourself to the Team

If you're an organizer or speaker, add yourself to the website:

1. Copy the template file: `cp team/template.yaml team/FirstName-LastName.yaml`
2. Edit your new file with your information (bio, expertise, social links, etc.)
3. Commit your changes and create a pull request

### Adding a Speaker

1. Copy the template file: `cp speakers/template.yaml speakers/FirstName-LastName.yaml`
2. Fill in the speaker's details and add a headshot to
   `{{ cookiecutter.repo_directory }}/assets/images/`
3. Commit your changes and create a pull request

### Updating Event Information

Key files to modify for event content:

- `cookiecutter.yaml` - Main event details (dates, location, description, banner image)
- `schedule.yaml` - Event schedule and speaker lineup
- `team/*.yaml` - Individual organizer profiles
- `speakers/*.yaml` - Individual speaker profiles

The build process consolidates the individual `team/` and `speakers/` files into
`team/team.yaml` and `speakers/speakers.yaml` automatically — don't hand-edit those aggregates.

## Technical Details

This website uses:

- **[Cookiecutter](https://cookiecutter.readthedocs.io/)** for templating
- **YAML configuration files** for easy content management
- **Jinja2** templating with Markdown support
- **Bootstrap** for responsive design
- **GitHub Pages** for hosting

### Building Locally

```bash
conda env create -f environment.yml
conda activate splashpage
./scripts/build_resources.sh
cd _build/html && python3 -m http.server 8000
```

## Getting Help

- **General Questions:** Contact the [ESIP team](https://www.esipfed.org/contact/)
- **Technical Issues:** Open an issue in this repository
- **Spark Information:** Visit https://www.esipfed.org/spark-agu/

## Links

- **Event Website:** https://esipfed.github.io/spark-2026/
- **ESIP:** https://www.esipfed.org/
- **Spark@AGU Info:** https://www.esipfed.org/spark-agu/
- **AGU Fall Meeting:** https://www.agu.org/fall-meeting

---

This site is based on the eScience [splashpage template](https://github.com/uwhackweek/splashpage-template)
and was adapted from [ESIPFed/spark-2025](https://github.com/ESIPFed/spark-2025).
