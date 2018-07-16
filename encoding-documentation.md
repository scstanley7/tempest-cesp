# Encoding Documentation for The Tempest @ FSU

## Table of Contents

1. Transcription
2. Encoding Divisions
3. Headings 
4. Common Features of Drama 
  * Dramatic Speech
  * Speaker Labels 
  * Prose Passages 
  * Verse Passages
  * Stage Directions 

## Transcription

You should transcribe most characters as they are seen on the page. This means recording the presence of long esses (&#x017f;) and ligatures for which there are Unicode reference points (&#x00e6;, &#x0153;, etc.).

In cases where there are allcaps passages, you should not transcribe the characters as you see them on the page. Instead, use title casing, or mixed casing (as is appropriate), and record the case of the passage using rendition the appropriate element ladders (e.g. `<head>`, `<hi>`, or `<speaker>`). For an extended discussion of how to record case, see the section on [rendition]

## Encoding Divisions

When encoding the plays, each structural division of the text should be marked with a `<div>` element. Divisions may nest inside of each other when the situation warrants it. For example, you should record each act of the play inside of a `<div type="act">`, and you should also record each scene inside of a `<div type="scene">`. `@type` is required on `<div>`. Allowable values for `@type` are:

* `castList` - (for cast lists/dramatis personae)
* `prologue` - (for prologues)
* `epilogue` - (for epilogues)
* `act` - (for acts)
* `scene` - (for scenes)
* prefatory (for miscellaneous prefatory material)
* conclusion (for miscellaneous conclusory materials)

## Headings

Record all section headings with `<head>`. In cases where the heading is in allcaps, record the heading in mixed title casing, and record the allcaps using [rendition]

In instances where there are headings followed by subheadings, record the subheading with `<head type="sub">`

## Common features of Drama

### Dramatic Speech

Record dramatic speech with the `<sp>` element. This element should wrap the entire speech, including the speaker label. The `<sp>` should always have a `@who` attribute that points to the `<castItem>` in the castlist (see below for further discussion of cast lists and identifying individual characters).

### Speaker Labels

You should record the speakers labels as they appear in the text, regardless of if there are misspellings or incorrect labels. Speaker labels should be recorded with `<speaker>`

### Prose Passages 

Prose passages should be recorded within `<p>`.

### Verse Passages 

Verse passages should be recorded with `<lg>` for multi-line passages. Each individual line should be recorded with an `<l>`. If there is a passage (i.e. a speech) that only contains one line, you don't need to use `<lg>` to wrap the single line. 

### Stage Directions 

You should record the presence of stage directions with `<stage>`. The `<stage>` element should have the required `@type` attribute, which records the type of action being described in the stage direction. The allowable values on for `@type` on `<stage>` are:

* **business** - describes some activity done on stage, such as "draws curtains" or "fetches water"
* **delivery** - describes how a line is delivered (e.g. "To Antonio" or "Aside")
* **entrance** - describes an entrance
* **exit** - describes an exit
* **location** - describes the location from which a line is spoken (not to be confused with locations described by `setting`)
* **modifier** - describes a modification to the a characters appearance (i.e. "In disguise" or "dressed as a sailor")
* **present** - used in cases where the stage directions only indicate the presence of the characters, without specifying if the characters have just entered or are remaining on stage. This will usually just be a list of names
* **prop** - indicates the presence of a prop without specifying the use of said prop 
* **remains** - indicates that characters remain on stage (usually with "manet" or "manent")
* **setting** - describes the setting that the scene is taking place in


