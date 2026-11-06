# Which number does Claude pick? An LLM random number test

In October 2026 I asked Claude for a random number between 1 and 100, 221 times, across three models. **Sonnet 5.5 said 47 in more than 90% of its answers.**

Then 225 more asks for 1 to 10,000. The chart went on r/dataisbeautiful and did **1 million views in about a day**. The write-up is [on my blog](https://saeedseo.com/blog/reddit-post-one-million-views/), and [the chart is here](https://www.reddit.com/r/dataisbeautiful/comments/1x9s7n7/).

## Results

| Model | Asks (1-100) | Distinct answers | Top answer |
|---|---|---|---|
| Haiku 4.5 | 76 | 2 | 47, in 58 of 76 (76%) |
| Sonnet 5.5 | 74 | 4 | 47, in 68 of 74 (92%) |
| Opus 5.5 | 71 | 6 | 42, in 43 of 71 (61%) |

The 1 to 10,000 runs were stranger. **221 of the 225 answers contain a 7.** The top ones were 7342 (Haiku 20 of 75, Opus 56 of 75) and 4817 (Sonnet 35 of 75).

## Method

`run_claude.sh` opens a temp folder and calls `claude -p` once per ask, so **no answer ever saw the one before it**.

Tools are off (`--tools ""`), and the system prompt is a bare "You are a helpful assistant." The prompt:

```
Pick a random number between 1 and 100. Reply with the number only.
```

Swap 100 for 10000 and it's the second set. The script **keeps digits only**, so "47." becomes 47. I didn't log timestamps.

## Files

| File | What's in it |
|---|---|
| `answers-1-to-100.csv` | 221 rows: ask (order in the file), model_alias, model, range, answer |
| `answers-1-to-10000.csv` | 225 rows, same columns |
| `run_claude.sh` | The script that collected them |

## FAQ

### Can Claude generate random numbers?

Asking it doesn't work. Haiku 4.5 gave **only 2 different answers in 76 tries**. For real randomness, have Claude run code.

### Why does AI pick 47 or 42?

These runs only count how often each number came up. **47 came out on top for Haiku and Sonnet**, and 42 for Opus.

### Can I reuse the data?

Yes, under CC BY 4.0. Credit it with the Zenodo record below.

## Cite

```
Shahriar, S. (2026). Which number does Claude pick? Zenodo. https://doi.org/10.5281/zenodo.23669725
```

License: CC BY 4.0.

## Related repos

| Repo | What it is |
|---|---|
| [claude-seo-skills-benchmark](https://github.com/s77sh/claude-seo-skills-benchmark) | 5 Claude Code SEO skill packs tested on 20 planted problems |
| [interview-prep-pack](https://github.com/s77sh/interview-prep-pack) | A Claude Code skill that builds interview prep from your own resume |
| [viral-reel-playbook](https://github.com/s77sh/viral-reel-playbook) | A Claude Code skill for Reels, TikTok and Shorts scripts |
| [bali-product-demand](https://github.com/s77sh/bali-product-demand) | Keyword Planner demand for 36 product niches in Bali |

What each one is for: [saeedseo.com/repos/](https://saeedseo.com/repos/).

## Author

Saeed Shahriar, senior SEO and growth marketer. [saeedseo.com](https://saeedseo.com)
