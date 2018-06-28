# Encoding Documentation for The Tempest @ FSU

## Transcription

You should transcribe most characters as they are seen on the page. This means recording the presence of long esses (&#x017f;) and ligatures for which there are Unicode reference points (&#x00e6;, &#x0153;, etc.).

In cases where there are allcaps passages, you should not transcribe the characters as you see them on the page. Instead, use title casing, or mixed casing (as is appropriate), and record the case of the passage using rendition the appropriate element ladders (e.g. `<head>`, `<hi>`, or `<speaker>`). For an extended discussion of how to record case, see the section on [rendition]

## Encoding Divisions

When encoding the plays, each structural division of the text should be marked with a `<div>` element. Divisions may nest inside of each other when the situation warrants it. For example, you should record each act of the play inside of a `<div type="act">`, and you should also record each scene inside of a `<div type="scene">`. `@type` is required on `<div>`. Allowable values for `@type` are:

* castList (for cast lists/dramatis personae)
* prologue (for prologues)
* epilogue (for epilogues)
* act (for acts)
* scene (for scenes)
* prefatory (for miscellaneous prefatory material)
* conclusion (for miscellaneous conclusory materials)

## Headings

Record all section headings with `<head>`. In cases where the heading is in allcaps, record the heading in mixed title casing, and record the allcaps using [rendition]

In instances where there are headings followed by subheadings, record the subheading with `<head type="sub">`

## Dramatic Speech

Record dramatic speech with the `<sp>` element. This element should wrap the entire speech, including the speaker label. The `<sp>` should always have a `@who` attribute that points to the `<castItem>` in the castlist (see below for further discussion of cast lists and identifying individual characters).

## Speaker Labels

You should record the speakers labels as they appear in the text
