# Erick's preferences when writing papers

**Important:** when you are done with a paper, upload all analysis files, compressed, to [Economy file storage](https://github.com/matsengrp/wiki/wiki/Economy-File-Storage-(long-term-data-archive)).

## General principles

* I strongly prefer one sentence per line in TeX files, which enables easy reorganization and diffs that do not get ugly from line wrapping.
* I like to write a fairly complete introduction first, ensuring that the work is properly motivated and hangs together before writing the rest.
* Understatement is powerful: overstating your advance doesn't really help make a case, and can annoy reviewers who are fond of previous methods.
  If you are making a substantial advance, they will notice.
* If you haven't spellchecked and read every word of the final version aloud, it's not ready to submit.
* **Important**: first revise at the section level, then the paragraph level, then the sentence level, then the word level.
Not following this can lead to a serious waste of effort by throwing away carefully crafted prose.
* Vladimir's organizational principle is to start each methods section with "we have data of this form" and describe what is desired of that data, and progressively unwind the methods based on that goal.
* Vladimir's goal is to keep people engaged as long as possible, and we want to keep them from getting annoyed/bored/confused and giving up on reading the paper.
* Please do not make major changes in paper structure or notation without us discussing it first.

## Section

* Sections should follow the layout specified by the intended journal.
* The work should be clearly motivated.
* Sections should flow logically.
* The last paragraph of the introduction should begin with an "In this paper" statement, and the rest of that paragraph should describe the contents of the paper.


## Paragraphs

* Paragraphs begin with topic sentences that make a complete statement then defended by the rest of the paragraph (if it is a complex statement, don't be afraid of the semicolon!).
* Generally speaking there should be one idea per paragraph.
* In almost all cases, a paragraph should have at least three sentences.
* Amazing advice from Harmit Malik: rather than ending a paragraph with a problem and starting the following paragraph with a solution, end the paragraph with an indication of the solution and then start the next paragraph with "Indeed, [then more fully reinforce my point and develop it more...]"


## Sentences

* Avoid writing about the process as if they were the primary object of interest. [Nominalizations](http://opinionator.blogs.nytimes.com/2012/07/23/zombie-nouns/?_r=2), a.k.a. zombie nouns, can reveal that you are slipping into meta-speak.
* If "the fact that" appears in your text you are using nominalizations.
* Simply put, *have the primary noun and the primary verb in the sentence describe the most important actor and action in that sentence*.
* Don't say: ~~We ran an analysis and the results are in Figure 1.~~ Instead: We find that XXX and YYY (Figure 1).
* use `eqref` to refer to equations, which puts in the parentheses. Don't put `Equation \eqref{xxx}`, just the reference itself.
* I like alternating between short and long sentences.
* Beware of [comma splices](https://www.grammarly.com/blog/comma-splice/) and run-ons.


## Words and punctuation

* I prefer simple words over fancy ones.
* If any word can be cut from a sentence without disturbing flow and/or meaning, it should be cut.
* The [which vs. that](http://www.chicagomanualofstyle.org/CMS_FAQ/Whichvs.That/Whichvs.That01.html) distinction is a bit dated, but still important.
* Use \`\` and '' (two single quotes) for open and close quotes in TeX.
* Please use a spell checker for all files, including accessory files such as responses to reviewers.
* Define acronyms once in the abstract (if needed), once in the main text, once in the figures, and once in the tables.


## Verb tense

Tense strategy should be consistent.
There are several different approaches.
Here are two.

### Simple strategy

Use present tense everywhere. 
This makes a lot of sense for methods-development manuscripts. 
Even the Discussion can work like this: "In this paper we develop a new approach...".

### Complex strategy

* Follow [this PDF](https://www.unlv.edu/sites/default/files/page_files/27/GradCollege-VerbTenseScientificManuscripts.pdf) as follows:
  * **Title**: Use the simple present tense when a complete sentence is appropriate, to describe a conclusion supported by the manuscript (e.g., “Gene X is required for cell differentiation”).
  * **Abstract and Introduction**: 
    * Use the present tense for widely accepted facts (e.g., “DNA is composed of four nucleotides”).
    * Use the present perfect tense for previous research with current relevance (e.g., “Studies have shown”).
    * Use the past tense when referring to specific methods from previous studies (e.g., “Smith sampled 96 swamps”).
    * Use the present tense when describing your contribution (e.g., “In this paper, we devise”).
  * **Methods**: There are two choices you can use, but be consistent.
    * If your paper is mostly about developing a new method (e.g., "We define a spurtle to be a set _X_") then use the present tense.
    * If your paper is mostly about experiments, use the past tense (e.g., “We built 200 trees”).
  * **Results**: Primarily use the past tense to describe completed experiments (e.g., “We detected no fluorescence”). Use the present tense when referring to the manuscript itself (e.g., “Figure 1 shows”) or defining a something (e.g., "Overlap metric is defined as"). Generally, statements that are always true should be in the present tense, while statements about something done/observed should be in the past tense.
  * **Discussion**: Use the past tense for specific results and methods (e.g., “We observed”), the present tense for conclusions (e.g., “We conclude”), and the future tense for proposed future research (e.g., “We will investigate”).



## Figures

Our foundation for data visualization will be [Fundamentals of Data Visualization](http://serialmentor.com/dataviz/) by Claus O. Wilke.
Please have a look next time you are designing your figures.

For cartoons, see the [Inkscape tutorial](https://github.com/fredhutchio/inkscape-tutorial) made by Erick.
SVG should be our default line-art format.

### Referring to figures

Figure descriptions belong in the figure legend, which is the most convenient for readers (the legend and the figure are together).

It is much stronger to make your statement and then refer to a figure parenthetically to justify your claim, such as

> Unicorns are generous (Figure 1).

rather than

> As we can see in Figure 1, unicorns are generous.

Even better is to integrate the figure reference into a topic sentence that describes the key finding:

> The \texttt{Rotavirus}, \texttt{Hepatitis}, and \texttt{Flu\_M} datasets have multiple plateaux, exhibiting small average pairwise RF distance when compared with the upper and lower bounds (\cref{f:rf-diameters}).

Avoid constructions like:
- "as shown in"  
- "is shown in"
- "The results are shown in"

Instead, make direct statements about your findings with parenthetical figure references.

### Figure design

Figure text should be large enough to be easily readable, and consistent across figures.

I really like colorbrewer colors.
Chris Small made [a nice SVG with all of them](http://f.cl.ly/items/3J140M2F2C0b1b0R3y0m/colorbrewer_swatch.svg).

Here are some settings I like for matplotlib:
```python
import matplotlib as mpl
import seaborn as sns

mpl.rcParams.update({
    'font.size': 16, 'axes.titlesize': 17, 'axes.labelsize': 16,
    'xtick.labelsize': 13, 'ytick.labelsize': 13,
    'font.family': 'Lato', 'font.weight': 600,
    'axes.labelweight': 600, 'axes.titleweight': 600,
    'figure.autolayout': True})

# Make plot, called `fig`

sns.despine(fig=fig, offset=10, trim=True)
```

## [Writing procrastinators, this letter is to you](https://www.nature.com/articles/s41587-025-02584-1)

## [Advice](https://www.mtholyoke.edu/acad/intrel/orwell46.htm) from George Orwell
* Never use a metaphor, simile, or other figure of speech which you are used to seeing in print.
* Never use a long word where a short one will do.
* If it is possible to cut a word out, always cut it out.
* Never use the passive where you can use the active.
* Never use a foreign phrase, a scientific word, or a jargon word if you can think of an everyday English equivalent.
* Break any of these rules sooner than say anything outright barbarous.

Related: [Novelist Cormac McCarthy’s tips on how to write a great science paper](https://www.nature.com/articles/d41586-019-02918-5)

## File layout
* Always one sentence per line.
* Use [this template](https://github.com/matsengrp/tex-template), including the .gitignore and SConstruct files. I work on lots of papers and this makes my life much easier and happier.
    * The main files that get compiled should be called `main.tex` and `main.bib`. Please do not spread the writing among multiple files using `\input`.
    * Any compiled files should be ignored via `.gitinore`, and an SConstruct file should be available for easy compilation.
    * You can include supplementary materials inside a single document: see the template for details.
* I will mark comments with `%EM` which refer to the line directly after. If the comment is straightforward and you make a change that clearly addresses it, feel free to delete the comment. If you don't agree with the comment or if clarification would be helpful, please add your own "rebuttal" comment just after mine. Rebuttals are totally great. Silently deleting comments you don't agree with is not.


## Latex
* Don't use `eqnarray`, use the various [amsmath alignment commands](https://www.sharelatex.com/learn/Aligning_equations_with_amsmath#/Splitting_and_aligning_an_equation) instead
* use `eqref` to refer to equations
* label equations with `eq:...`, lemmas with `lem:...`, etc.
* Avoid referring to section numbers-- many journals don't allow that.
* Please keep it simple. Using `include` and complex compilation tricks will only cause pain in arXiv and journal submission steps.
* Please have your tex compile cleanly, including references.


## Writing a cover letter: advice from Harlan Robins (transcribed as directly as possible from conversation; take with a grain of salt)
*The point of your cover letter is to tell the editor all sorts of shit that wouldn't be professional in a scientific paper.* This includes

* Bashing and dismissing previous work in the field
* Speculative discussion of how this paper will enable other amazing things to happen in the field, like "if we could do this then..."

The cover letter is not to summarize the paper. That's what the paper is for. He suggested a structure with one paragraph of bashing then a paragraph contrasting this with our work, including some speculation. Then some bullet points about why the paper will be popular with various types of scientists. A more traditional take from Springer is [available here](https://www.springer.com/gp/authors-editors/authorandreviewertutorials/submitting-to-a-journal-and-peer-review/cover-letters/10285574).

## Writing a response to reviewers: advice from Michael Emerman
* Overall idea: the AE should be able to just read the reviews and not the revised manuscript to understand how you responded.
* Almost every change should have a direct reference to something new in the text.
* Changes in terminology, definitions, new results, etc, should all be included.
* Don't ask questions in your response (if there is uncertainty in something, just go with your best guess of what it is).
* If the reviewer says something is unclear, then readers will likely find it unclear as well, so best to rewrite.
* Paper citations in reviews are great.
* Generally speaking, don't compliment the reviewers, unless they suggest someting really great.

[Ten simple rules for writing a response to reviewers](http://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1005730) by Bill Noble.

## Checklist for submission

### Initial submission

* Does the latex compile cleanly?
* Do we refer to every figure? In order?
* Have we acknowledged everyone who discussed the work with us?

### Final submission

* Have all `subfigure` and `tikz` uses been eliminated?
* Are all of the citations up to date? Look for "arxiv" and "biorxiv" and fix them.
* Have you double checked the grant citations, as well as the author contributions sections?



## [Advice](http://andrewgelman.com/2014/01/14/advice-writing-research-articles/) from Andrew Gelman

### How to write a paper
1. Start with the conclusions. Write a couple pages on what you’ve found and what you recommend. In writing these conclusions, you should also be writing some of the introduction, in that you’ll need to give enough background so that general readers can understand what you’re talking about and why they should care. But you want to start with the conclusions, because that will determine what sort of background information you’ll need to give.

2. Now step back. What is the principal evidence for your conclusions? Make some graphs and pull out some key numbers that represent your research findings which back up your claims.

3. Back one more step, now. What are the methods and data you used to obtain your research findings.

4. Now go back and write the literature review and the introduction.

5. Moving forward one last time: go to your results and conclusions and give alternative explanations. Why might you be wrong? What are the limits of applicability of your findings? What future research would be appropriate to follow up on these loose ends?

6. Write the abstract. An easy way to start is to take the first sentence from each of the first five paragraphs of the article. This probably won’t be quite right, but I bet it will be close to what you need.

7. Give the article to a friend, ask him or her to spend 15 minutes looking at it, then ask what they think your message was, and what evidence you have for it. Your friend should read the article as a potential consumer, not as a critic. You can find typos on your own time, but you need somebody else’s eyes to get a sense of the message you’re sending.

### Details

Remove all contentless words and phrases, such as:

- “Of course”
- “Note that”
- “Interestingly”
- “very”
- “nice”
- “We can see that”
- “It is important to note that”

Give descriptive captions to all your figures and tables. For example, in Figure 1, add a sentence explaining why you call this observation “extreme.” . . .

### General principles

(a) Don’t write something unless you expect people to read it.

(b) This principle holds for tables and figures as well. Consider Table 2. Do you want the reader to know that in line 3, Min Obs is 894? I doubt it. If so, you should make a case for this. If not, don’t put it down. When an article is filled with numbers and words that you neither expect or want people to read, this distracts them from the content. . . .

- It’s hard for me to believe that the new methods dominate the old methods. Maybe so, but I’d find the presentation more convincing if the authors gave some discussion of why the new methods work better, and—especially important—where the new methods would not be expected to perform well. . . .
