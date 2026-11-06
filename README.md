# Which number does Claude pick? An LLM random number test

221 "random number between 1 and 100" prompts to Claude Haiku 4.5, Sonnet 5.5 and Opus 5.5, plus 225 follow-up prompts for 1 to 10,000. Collected by Saeed Shahriar in October 2026 with Claude Code's `claude -p`.

## Method

Each ask is a fresh call: no conversation history, system prompt "You are a helpful assistant.", no tools, run from an empty folder. The prompt is "Pick a random number between 1 and 100. Reply with the number only." (or 1 and 10000). Non-digits are stripped from the reply. `run_claude.sh` is the script used.

## Files

- `answers-1-to-100.csv`: 221 rows. Columns: ask (order within the file), model_alias, model, range, answer.
- `answers-1-to-10000.csv`: 225 rows, same columns.
- `run_claude.sh`: the collection script.

No timestamps were recorded.

## Results

| Model | Asks (1-100) | Distinct answers | Top answer |
|---|---|---|---|
| Haiku 4.5 | 76 | 2 | 47, in 58 of 76 (76%) |
| Sonnet 5.5 | 74 | 4 | 47, in 68 of 74 (92%) |
| Opus 5.5 | 71 | 6 | 42, in 43 of 71 (61%) |

For 1 to 10,000: 221 of the 225 answers contain a 7. Top answers: 7342 (Haiku 20/75, Opus 56/75) and 4817 (Sonnet 35/75).

## Related

- Write-up: https://saeedseo.com/blog/reddit-post-one-million-views/
- The chart on r/dataisbeautiful (1M views): https://www.reddit.com/r/dataisbeautiful/comments/1x9s7n7/

## FAQ

**Can Claude generate random numbers?**
Not when you just ask it. Asked for a random number between 1 and 100 in a fresh session, Haiku 4.5 gave only 2 different answers in 76 tries, and Sonnet 5.5 said 47 in 68 of 74. A model picks the likely answer, not a random one. For real randomness, have it run code instead.

**Why does AI pick 47 or 42?**
These runs don't explain why, only how often. 47 and 42 were the top answers here: 47 for Haiku and Sonnet, 42 for Opus.

**Can I reuse the data?**
Yes, under CC BY 4.0. Cite the Zenodo record below.

## Related repos

- [claude-seo-skills-benchmark](https://github.com/s77sh/claude-seo-skills-benchmark): 5 Claude Code SEO skill packs tested on 20 planted problems.
- [interview-prep-pack](https://github.com/s77sh/interview-prep-pack): a Claude Code skill that builds interview prep from your own resume.
- [viral-reel-playbook](https://github.com/s77sh/viral-reel-playbook): a Claude Code skill for Instagram Reels, TikTok and YouTube Shorts scripts.
- [bali-product-demand](https://github.com/s77sh/bali-product-demand): Google Keyword Planner demand for 36 product niches in Bali.

All of them, with what each one is for: [saeedseo.com/repos/](https://saeedseo.com/repos/).

Cite: Shahriar, S. (2026). Which number does Claude pick? Zenodo. https://doi.org/10.5281/zenodo.23669725

License: CC BY 4.0.
