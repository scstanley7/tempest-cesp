# Encoding Rendition 

## Narrative

We attempt to encode as many the typographical features as we can using the TEI's `@rend` attribute. Some features that we usually include information about are: 

* slant (i.e. italic or upright)
* alignment (i.e. left, right, center, justified)
* indentation 

We also include some less intuitive information with `@rend` such as when characters are used to delimit textual features (e.g. quotation marks around speech, asterisks after annotated text, or braces before marginal notes).

We use rendition ladders to encode rendition of textual features. The benefit of rendition ladders is that they can be stacked, so that you can include information about more than one renditional feature (e.g. you can both say that a bit of text is in allcaps and italicized). Rendition ladders are composed of a keyword followed by an argument in parentheses. This generally looks like: `align(center)case(allcaps)slant(italic)`. Order does not matter in rendition ladders, although putting the keywords in alphabetical order can help when checking the text.

The renditional keywords and arguments for this project are adapted from the [Women Writers Project Internal Encoding Documentation](http://wwp.northeastern.edu/research/publications/documentation/internal/#!/entry/rendition_narrative).

## Renditional keywords

### align

Describes the alignment of the textual feature. Allowable arguments are:

* `left`
* `center` 
* `right`

When not specified, aligment defaults to `align(left)`

### bestow 

Describes rendition that is only true in a given context (i.e. when italicized stage directions have personal names that are always `slant(upright)`). This will only ever be found as a renditional default in the `<teiHeader>` and should not be used in inline encoding. Ask the project director if you encounter this as a renditional default.

### braced 

Indicates when a brace is connecting several textual features (e.g. several connected list items). The argument for `braced()` should either be empty (if there is no label) or a pointer to whatever label exists. 

For example, a textual passage that looks like this (where the brace covers bullet points 2-4):

> * Jane Eyre 
> * Middlemarch 
> * Silas Marner } George Eliot novels
> * The Mill on the Floss 
> * Persuasion 

Would be encoded like this:

```
<list>
  <item>Jane Eyre</item>
  <list rend="braced(#label)">
    <label rend="align(right)" xml:id="label"></label>
    <item>Middlemarch</item>
    <item>Silas Marner</item>
    <item>The Mill on the Floss</item>
  </list>
  <item>Persuasion</item>
</list>
```

### break 

This keyword is used to specify if the textual feature begins on a new line. The allowable arguments are:

* `yes` (occurs on a new line)
* `no` (does not occur on a new line)

If you use `break(yes)` you do not need to include an `<lb/>`. The default for all elements is `break(no)`, although you should check the renditional defaults specified in the `<teiHeader>` to make sure that default hasn't been overridden for the document you are encoding.

### case 

Indicates the case for the textual feature. Allowable arguments are: 

* allcaps 
* smallcaps 
* mixed

Smaller versions of allcaps are not necessarily smallcaps!! Smallcaps are allcaps passages that still have slightly larger initial letters. It's somewhere between mixed casing and allcaps.

The default for all text is mixed casing, but double check that default hasn't been overridden in the renditional defaults for your document.

### first-indent 

First indent is used to indicate if the first line of a textual feature is indented from the text that follows. The argument for first-indent will always be a number. The argument will be however many spaces from the left margin the first indent is offset.

Sometimes the first indent will be a negative number, as is seen in the following example:

> This is a textual feature that contains a 
> <br/>&nbsp;&nbsp; negative first-indent. As you can see 
> <br/>&nbsp;&nbsp; the text on the lower lines is indented
> <br/>&nbsp;&nbsp; further than the text on the first line.

This passage would be encoded like this:

```
<p rend="indent(1)first-indent(-1)">This is a textual feature that contains a 
<lb/>negative first-indent. As you can see 
<lb/>the text on the lower lines is indented
<lb/>further than the text on the first line.</p>
```

`first-indent` should always be calculated relative to the rest of the text, not in relation to the margin (which is why, in this case, we've used "-1" and not ("0"))

For more information on indentation, see the section for the keyword `indent()`

### indent 

`indent()` specifies how far the textual feature is indented from the left margin. It takes a number as its argument. The argument should be the number of ems from the left margin.

### pre/post 

`pre()` and `post()` are used to specify characters or other features that come before or after a textual feature. For example, if recorded speech is delimited by quotation marks, it would be encoded as: `<said rend="pre(“)post(”)"`. If an annotated section is followed by an asterisk, it would be encoded `<seg rend="post(*)">`.

Usually the argument of `pre()` and `post()` will be a character. However there are a few exceptions.

When a section (e.g. a division or a heading) is preceded or followed by a ruled line, you would encode it as `pre(#rule)` or `post(#rule)`. 

When a section is followed or preceded by an ornamental section it should be encoded as `pre(#ornament)` or `post(#ornament)`. Ornaments are usually distinguished by the fact that they are decorative features that do not correspond to the text. Decorative features that *do* correspond to the content of the text should be encoded with `<figure>`

### slant 

`slant` is used to record text that is italicized or upright. The allowable arguments are:

* italic
* upright (usually used to cancel out a default of `italic` or used to indicate upright text within an italicized passage) 

The default for all text is `upright`, although you should check the renditional defaults for your text to make sure that a feature hasn't been given a localized renditional default of `slant(italic)`. 
