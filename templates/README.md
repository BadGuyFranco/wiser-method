# WISER Method Templates

Practitioner templates for the WISER Method. 35 templates organized by canon, available as description specs, HTML sources, and PDF reference cards.

Licensed under CC BY-SA 4.0. See the LICENSE and NOTICE files in the repository root.

## Directory Structure

```
templates/
├── AGENTS.md
├── template-templates/          <- Base HTML templates and design system
│   ├── portrait.html
│   ├── landscape.html
│   ├── reference-card.html
│   └── shared/
│       ├── wiser-template.css   <- CSS design system
│       └── assets/
│           ├── wiser-owl.png
│           └── wiser-logo.png
├── 10-team-setup/
├── 11-playbook-system/
├── 12-witness-plays/
│   └── friction-map/
│       ├── description.md       <- Format-neutral template spec
│       └── friction-map-template.html
├── 13-interrogate-plays/
├── 14-solve-plays/
├── 15-expand-plays/
├── 16-refine-plays/
├── 17-rhythm-plays/
└── 19-creating-plays/
```

## How Templates Work

**Description specs are the single source of truth.** Each template has a `description.md` that defines its purpose, fields, types, options, example data, and views in a format-neutral way. You can use these specs to build the templates in any tool: Notion, Google Sheets, Airtable, or anything else.

**HTML templates** exist for the PDF reference cards. They use a shared CSS design system (`template-templates/shared/wiser-template.css`) and can be converted to PDF with any headless browser (Puppeteer, Playwright, etc.).

**Ready-to-use versions** are available at [wisermethod.com/templates](https://wisermethod.com/templates) as a Notion workspace and Google Sheets workbooks.

## Description Spec Format

Every template gets a `description.md` in its chapter folder. This is the format-neutral blueprint.

```markdown
# [Template Name]

**Chapter:** [Number] ([Chapter Name])
**WISER phase:** [Witness | Interrogate | Solve | Expand | Refine | Rhythm]
**Position:** [Primary position that uses this template]

## Purpose

[1-2 sentences: what this template helps the practitioner accomplish]

## When to Use

[Specific triggers or moments when this template should be used]

## Properties / Columns

| Property | Type | Options | Description |
|----------|------|---------|-------------|
| [Name] | title | | [What this field captures] |
| [Status] | select | Option A, Option B, Option C | [What the options mean] |

## Relations

| Property | Links to | Purpose |
|----------|----------|---------|
| [Assumption Tested] | Assumption Inventory | [Why this link exists] |

## Views

| View name | Type | Filter / Group | Purpose |
|-----------|------|----------------|---------|
| All | table | None | Default view |

## Example Entries

[2-3 realistic sample entries showing what good data looks like]
```

## Template Inventory

### Databases (14)

| Database | Section | Chapter | Properties | Relations |
|----------|---------|---------|------------|-----------|
| Team Roster | 10 Team Setup | 10 | 5 | None |
| DACI Matrix | 10 Team Setup | 10 | 8 | None |
| Decision Log | 11 Playbook | 11 | 8 | None |
| Risk Register | 11 Playbook | 11 | 7 | None |
| Friction Map | 12 Witness | 12 | 11 | To Context Assessments |
| Observation Notes | 12 Witness | 12 | 9 | None |
| Assumption Inventory | 13 Interrogate | 13 | 7 | From Experiment Log |
| Experiment Log | 13 Interrogate | 13 | 12 | To Assumptions |
| Value Validation Tracker | 14 Solve | 14 | 12 | None |
| Context Assessments | 15 Expand | 15 | 10 | To Friction Map |
| Incident Log | 16 Refine | 16 | 9 | To Risk Register |
| Hierarchy of Agency | 16 Refine | 16 | 10 | To Risk Register |
| Red Team Test Plan | 16 Refine | 16 | 10 | To Incident Log |
| Meeting Notes | 17 Rhythm | 17 | 7 | None |

### Pages (15)

| Page | Section | Chapter | Type |
|------|---------|---------|------|
| Position Handoff Checklist | 10 Team Setup | 10 | Checklist |
| User Flow Map Guide | 12 Witness | 12 | Guide |
| Rapid Prototyping Checklist | 13 Interrogate | 13 | Checklist |
| Pilot Planning Checklist | 14 Solve | 14 | Checklist |
| Objective Quality Framework | 14 Solve | 14 | Checklist |
| Human-in-the-Loop Protocol | 14 Solve | 14 | Guide |
| Expansion Readiness Checklist | 15 Expand | 15 | Checklist |
| Deployment Gate Checklist | 15 Expand | 15 | Checklist |
| Drift Monitoring Checklist | 16 Refine | 16 | Checklist |
| Graduation Decision Framework | 16 Refine | 16 | Guide |
| Team Rhythm Agenda | 17 Rhythm | 17 | Agenda |
| Canon Transition Checkpoint | 17 Rhythm | 17 | Agenda |
| Autonomy Graduation Review | 17 Rhythm | 17 | Agenda |
| After-Action Review | 17 Rhythm | 17 | Agenda |
| Play Template | 19 Creating Your Own Plays | 19 | Template |

### Reference Cards (PDF)

| Template | Chapter | Format |
|----------|---------|--------|
| Position Reference Cards | 10 | reference-card |
| Playbook Quick Reference Card | 11 | reference-card |
| Experiment Type Selector | 13 | reference-card |
| Iteration Triggers Reference | 16 | reference-card |

## Cross-Database Relations

| From | To | Purpose |
|------|----|---------|
| Experiment Log | Assumption Inventory | Which assumption does this test? |
| Context Assessments | Friction Map | Which friction points are relevant? |
| Incident Log | Risk Register | Which risk materialized? |
| Red Team Test Plan | Incident Log | Which finding became an incident? |
| Hierarchy of Agency | Risk Register | Which risk does this decision type address? |

## Design System

### Color Palette

| Token | Hex | Usage |
|-------|-----|-------|
| `--color-dark` | `#404040` | Body text |
| `--color-light` | `#f9f9f4` | Subtle backgrounds |
| `--color-primary` | `#15665c` | Teal. Primary accent |
| `--color-accent` | `#e56b00` | Orange. Warnings only |
| `--color-white` | `#ffffff` | Page background |

### Brand Assets

Located in `template-templates/shared/assets/`:

| Asset | File | Usage |
|-------|------|-------|
| WISER Owl | `wiser-owl.png` | PDF header bar |
| WISER Logo | `wiser-logo.png` | PDF footer |
