# Spark@AGU Splash Page Repository

Spark@AGU is a Python-based website generator that creates event landing pages using cookiecutter templating system. The site features event information, schedules, team profiles, and sponsor details with a responsive design.

Always reference these instructions first and fallback to search or bash commands only when you encounter unexpected information that does not match the info here.

## Working Effectively

### Environment Setup and Build Process
Set up the environment and build the website:
- Source conda: `source /usr/share/miniconda/etc/profile.d/conda.sh`
- Create environment: `conda env create -f environment.yml` -- takes 40 seconds. NEVER CANCEL. Set timeout to 90+ seconds.
- Activate environment: `conda activate splashpage`
- Build website: `./scripts/build_resources.sh` -- takes <1 second. NEVER CANCEL. Set timeout to 30+ seconds.

### Testing the Website
Test the built website locally:
- ALWAYS run the environment setup and build steps first.
- Start local server: `cd _build/html && python3 -m http.server 8000`
- Test basic functionality: `curl -s http://localhost:8000/ | grep '<title>'`
- View in browser: navigate to `http://localhost:8000`

### Key Build Outputs
- HTML output: `_build/html/index.html`
- Assets: `_build/html/assets/` (CSS, JS, images)
- Generated files: `cookiecutter.json`, `team.yaml`

## Validation

### Required Manual Validation Steps
ALWAYS manually validate any changes by running through complete end-to-end scenarios:
- Build the website using the build process above
- Start the local HTTP server: `cd _build/html && python3 -m http.server 8000`
- Navigate to the website in a browser or use curl to test key pages: `curl -s http://localhost:8000/ | grep '<title>'`
- Test interactive features:
  - Navigation menu links (About, Team, Schedule, Sponsors)
  - Countdown timer functionality (shows live countdown)
  - Team member modal popups (click team member names like "Aaron Friesz")
  - Schedule tab navigation
  - External links (sponsors, social media links)

### YAML Validation
Run YAML linting to check configuration syntax:
- `yamllint .` -- takes <1 second. Note: This will show many formatting warnings which are non-critical but can be used to improve code style. Exit code 1 with warnings is expected and normal.

### Build Validation
Always test the complete build cycle after making changes:
- Clean previous builds: `rm -rf _build/ cookiecutter.json`
- Run full build process as documented above
- Verify output files exist and contain expected content

## Common Tasks

### Editing Event Configuration
Key configuration files:
- `cookiecutter.yaml` - Main event details (dates, location, description)
- `schedule.yaml` - Event schedule and timing
- `team/*.yaml` - Individual team member profiles

### Adding Team Members
Create a new YAML file in `team/` directory following this template:
```yaml
- title: Your Name
  avatar: https://avatars.githubusercontent.com/username
  role: Your Title
  organizations:
    - name: Your Institution
      url: https://institution-url.com/
  bio: A brief bio about yourself
  expertise:
    - Skill 1
    - Skill 2
  social:
    - icon: github
      link: https://github.com/username
  user_groups:
    - Your Role (e.g., Spark Organizer, Spark Presenter)
```
After adding team member files, the build process automatically consolidates them into `team.yaml`.

### Deployment
The website is automatically deployed to GitHub Pages via GitHub Actions when changes are pushed to the main branch:
- Workflow file: `.github/workflows/publish.yml`
- Triggers on push to main branch
- Build time in CI: ~2-3 minutes. NEVER CANCEL CI builds.
- Deployment target: GitHub Pages

## Technology Stack and Dependencies

### Core Technologies
- **Python 3.11** with conda environment management
- **Cookiecutter 2.6.0** for templating
- **Jinja2** templating engine with markdown extension
- **YAML** configuration files with include directive support
- **Static HTML/CSS/JS** output with Bootstrap styling

### Key Dependencies (from environment.yml)
- `cookiecutter` - Template processing
- `jinja2>=2.11` - Template engine
- `pygments>=2.6.1` - Syntax highlighting
- `pymdown-extensions>=7.1` - Markdown extensions
- `jinja-markdown==1.210911` - Markdown support in templates

### Build Scripts
- `scripts/build_resources.sh` - Main build script
- `scripts/build_team_yaml.sh` - Consolidates team member files
- `scripts/yaml2json.py` - Converts YAML config to JSON for cookiecutter
- `scripts/yaml_tools.py` - YAML include directive support

## Development Workflow

### Making Configuration Changes
1. Edit relevant YAML files (`cookiecutter.yaml`, `schedule.yaml`, `team/*.yaml`)
2. Run build process: `./scripts/build_resources.sh`
3. Test locally: start HTTP server and validate functionality
4. Commit changes - GitHub Actions will automatically deploy

### Common File Locations
Repository root contains:
- `README.md` - Basic setup instructions
- `environment.yml` - Conda environment specification
- `cookiecutter.yaml` - Main configuration
- `schedule.yaml` - Event schedule
- `team/` - Team member profiles
- `scripts/` - Build scripts
- `{{ cookiecutter.repo_directory }}/` - Template files
- `.github/workflows/publish.yml` - Deployment workflow

Template directory `{{ cookiecutter.repo_directory }}/` contains:
- `index.html` - Main page template
- `assets/` - Static assets (CSS, JS, images, fonts)

### Expected Timing
- Environment creation: 40 seconds
- Website build: <1 second
- Local testing setup: 2-3 seconds
- CI deployment: 2-3 minutes

### Troubleshooting
Common issues and solutions:
- **Build fails**: Check YAML syntax in configuration files
- **Missing team members**: Verify YAML files exist in `team/` directory
- **Styling issues**: Check `assets/` directory is properly copied
- **Environment issues**: Remove and recreate conda environment