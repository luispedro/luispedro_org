---
title: "Uncommon Ground"
categories: art
meta: "Uncommon Ground: a party game where each team finds what they secretly have in common, and rivals pounce if they share it too."
---

<img src="/files/images/uncommon-ground.png" alt="Uncommon Ground logo" style="float: right; width: 36.0%; padding-left: 1em;" />

[**Uncommon Ground**](https://uncommon-ground.xyz/) is a party game for teams:
each team writes down things that _everyone_ on the team has in common, and the
other teams pounce if they share them too.

We have all played some silly ice-breaker game at work or school. A few years
ago, I played a decent one, but halfway through I realised that there was a
better way to do it. I implemented it and we ran it as part of a SEARCHER
consortium event.

You can [run it yourself](https://uncommon-ground.xyz/). You need a projector or
a big screen and an MC to run the game, and every team needs one person with a
phone to join (just one).

## The rules of the game

This is played by teams (4–6 people each is a good number, 3–6 teams is another
good number). There are two phases.

In the **first phase**, each team writes down things that everyone on the team
has in common. This first phase is what I had played before, which was kind of
fun, but the second half of that game was a bit of a letdown: the teams read
their answers aloud, and the other teams just nodded along.

Therefore, I added a **second phase**: the answers are revealed one at a time,
and the other teams get to challenge them. The rule is that to write down a
commonality, every member of the team must share it, but to challenge it, it is
enough for all but one of the challenging team to have it.

You get 2 points if your answer is unchallenged, and 1 point for every
successful challenge. The team with the most points at the end wins. The
challenge mechanism means that while writing down something basic like _we all
had coffee today_ is a legal move, it is a bad move.

## A few design choices

**Only the captain's phone is in the game.** Each team designates one captain,
and only the captain's phone is in the game. In fact, if a second person joins
the team, that triggers the first person to be kicked out. This is intended to
keep the game social and have people look at each other instead of at their
phones.

**We need a human MC.** When an answer is revealed, challenges are shouted out
and adjudicated by the MC. This was, again, about trying to make the game more
IRL.

**Multiple teams can score challenge points for the same answer.** I did not
want to make this a first-to-buzz game. Let people talk it out. Even if another
team has already challenged an answer, you can still challenge it as well, so
you are incentivised to keep thinking and discussing with your team.

**Answers are shown one by one.** Showing the answers is also part of the game,
so they are revealed one at a time. This probably slows down the game a bit, but
you do want to give time for everyone to process information like _we all lived
in Helsinki at some point_ and think about whether they can challenge it.

## This was obviously vibe coded

This was almost completely vibe coded with Claude. I wrote the rules in bullet
points and Claude designed the app. I iterated a few times, but I hardly looked
at the code. I asked it for deployment instructions and it gave me a few things
to copy and paste into my server, and that was it. Almost all my decisions were
design decisions.

The biggest category of mistake it consistently made was being fragile if users
have flaky internet connections. That is hard to encode as tests, too.

The logo is by ChatGPT, which surprisingly was also able to export it to SVG.

---

_This was originally posted [on my
Substack](https://luispedro.substack.com/p/uncommon-ground)._
