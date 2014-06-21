# Development Notes

*An IRC conversation discussing packaging and overal user experience when developing LFE projects.*

The conversations below are from one day (20 June 2014) on #erlang-lisp
(Freenode). They are all inlcuded for the sake of completeness and context.
They are as follows:

 * Hack Day and lfetool v2 Progress
 * Hack Day Prep
 * Packaging for LFE
   * New Github Org Proposal: LFE & LFEX
   * Downloading, Dependencies, and Packaging
   * Removing the Dependency upon Rebar
   * Summary, Call for Discussion, Github Orgs Revisited, and Bootstrapping

## Hack Day and lfetool v2 Progress

```
[07:57:05]  <oubiwann-hackday>   rvirding: troutwine and I will be hacking on lfetool today at work :-)
[07:57:33]  <oubiwann-hackday>   I've been making gradual progress on the rewrite from bash to LFE
[07:58:46]  <oubiwann-hackday>   we're going to look at writing a process that scans all lfetool plugins, builds a tree of supported commands, and then listens for a command/subcommand/arg sequence
[07:59:01]  <oubiwann-hackday>   possibly also look into defining a custom behaviour for plugins
[07:59:43]  <oubiwann-hackday>   wow
[07:59:49]  <oubiwann-hackday>   33 folks hanging out here in IRC now
[07:59:56]  <oubiwann-hackday>   I think that's a new LFE record ;-)
[08:01:26]  <@rvirding>  Hacking on it at work, wow.
[08:02:01]  <@rvirding>  Yes interest seems to be growing
[08:03:13]  <@rvirding>  I'm relaxing celebrating midsummer. Get back to hacking tonight or tomorrow
[08:08:34]  <oubiwann-hackday>   rvirding: nice! I hope to get some of that relaxing done this weekend :-)
[08:08:53]  <oubiwann-hackday>   rvirding: enjoy midsummer! (midsommer?)
[08:09:25]  <@rvirding>  Thank you
```

## Hack Day Prep

```
[10:25:52]  <troutwine>  oubiwann-hackday: Currently reading through the issues, familiarizing myself etc etc.
[10:26:03]  <oubiwann-hackday>   nice :-)
[10:26:22]  <oubiwann-hackday>   troutwine: just closed this one: https://github.com/lfe/lfetool/issues/47
[10:26:37]  <oubiwann-hackday>   basic architecture is now in place
[10:26:46]  <oubiwann-hackday>   *much* simpler than the bash version :-)
[10:27:25]  <troutwine>  Looks like I might get pulled off by Real Work though... build failure.
[10:27:28]  <troutwine>  *sad trombone*
[10:27:39]  <oubiwann-hackday>   ugh
[10:27:50]  <oubiwann-hackday>   well, when you come back, I think we can spend the rest of the day here: https://github.com/lfe/lfetool/issues/50
[13:29:57]  <oubiwann-hackday>   troutwine: I'm going to hack on lfetool:dispatch for a bit right now ... probably break it up a bit
[13:30:12]  <oubiwann-hackday>   I want to clarify the error-handling logic and command dispatch logic
[13:30:33]  <oubiwann-hackday>   (which will mostly be code comments at first)
[13:30:34]  <troutwine>  Neat. The bootstrapping is coming along okay. (Reminder: I have a dentist appointment this afternoon.)
[13:30:46]  <oubiwann-hackday>   oh, yeah... forgot
[13:31:16]  <oubiwann-hackday>   feel free to push up a partial branch and submit a PR, and I can integrate what you've done to that point
[13:31:23]  <oubiwann-hackday>   that way you get committer credit :-)
[13:37:49]  <oubiwann-hackday>   here comes a cons ...
[13:39:02]  <oubiwann-hackday>   so much dispatch
[13:39:05]  <oubiwann-hackday>   many wow
[13:43:11]  <kyl>    such tables?
[13:43:44]  <oubiwann-hackday>   hehe
[13:43:46]  <oubiwann-hackday>   no tables
[13:43:55]  <oubiwann-hackday>   all LFE, all command line, all the time
[13:44:05]  <oubiwann-hackday>   we sent Bobby home crying
[13:45:40]  <kyl>    was thinking of CL dispatch tables
[13:49:01]  <oubiwann-hackday>   hehe
[13:49:07]  <oubiwann-hackday>   you out-geeked me!
[13:49:10]  <kyl>    :D
[13:49:21]  <kyl>    I've been doing a lot of CL lately
[13:49:28]  <oubiwann-hackday>   also: lfetool v2 now has plugin/non-plugin dispatch working :-)
[13:49:31]  <kyl>    to offset having to do some java lately
[13:49:33]  <kyl>    \o/
[13:49:40]  <oubiwann-hackday>   kyl: that sounds like the right antidote!
[13:50:14]  <kyl>    dumb me signed up for a couple coursera classes a few months ago and forgot about them
[13:50:25]  <kyl>    also, I only sort of have internet at home, and have to learn java
[13:50:29]  <kyl>    it's an interesting combination
[13:50:35]  <kyl>    so I lisp to make it better
[13:51:08]  <oubiwann-hackday>   hehehe
[13:51:32]  <kyl>    glad to see some plugins for lfetool
[13:51:59]  <kyl>    even if it's in support of, dare I even say the word? a Lisp-1... lein is really awesome and would be a good model for lfetool
[13:53:47]  <oubiwann-hackday>   hehehe
[13:53:58]  <oubiwann-hackday>   yeah, lein is an awesome tool
[13:54:12]  <oubiwann-hackday>   it's been the source of inspiration for pretty much all of lfetool
[13:54:20]  <kyl>    I thought as much
[13:54:49]  <oubiwann-hackday>   as fun/silly as bash hacking can be, I'm REALLY preferring writing lfetool in LFE itself
[14:06:53]   troutwine is now known as troutwine_away
[14:14:04]  <kyl>    bash has its uses, but it only gets you so far
[15:05:26]  <@rvirding>  oubiwann-hackday: are you using the new lfe command and is it working as it should?
[15:05:44]  <oubiwann-hackday>   I've only used it a little bit
[15:05:51]  <oubiwann-hackday>   rvirding: no issues so far, though!
[15:06:11]  <@rvirding>  good good
```

## Packaging for LFE

What Robert means by "packaging" is a term that describes, in a very general
sense, the processes (the fewer the better) that devs need to use in order
to get up and running quickly with LFE on their own project. For example,
this would include getting deps, compiling them, including only the external
packages that we needed/wanted, etc.

As becomes clear below, Robert would prefer to have a single LFE way of doing
these things without depending upon external tools. He would like to avoid
the bootstrapping problem (and having to deal with tools that are always
changing underneath their users).

### New Github Org Proposal: LFE & LFEX

```
[15:29:20]  <oubiwann-hackday>   rvirding: what do you think about making the lfe github org for official LFE stuff only?
[15:30:01]  <@rvirding>  how do you mean?
[15:32:20]  <oubiwann-hackday>   rvirding: well, there's a lot of stuff in the lfe org on github (http://github.com/lfe), and I was thinking of putting all that here: https://github.com/lfex/
[15:33:00]  <oubiwann-hackday>   this might help with packaging, releases, general orderliness, etc.
[15:33:49]  <oubiwann-hackday>   lfe.io, docs.lfe.io, blog.lfe.io, etc. would go in lfe
[15:34:06]  <oubiwann-hackday>   maybe if we don't merge lfeunit into LFE proper, it could go there
[15:34:13]  <oubiwann-hackday>   probably the lfetool repo
[15:34:28]  <oubiwann-hackday>   and if you wanted to maintain *the* lfe repo there too, you could
[15:34:42]  <oubiwann-hackday>   (with the knowledge that it would be just as protected as your own repo)
[15:35:16]  <oubiwann-hackday>   and that the community hacking/repos/etc. would be happening in lfex
[15:35:31]  <@rvirding>  I have been thinking a bit about your lfe list post about that
[15:36:09]  <oubiwann-hackday>   rvirding: to be honest, I had the idea from trying to guess what you might like :-)
[15:36:20]  <oubiwann-hackday>   (maybe I got my guess totally wrong)
[15:36:20]  <@rvirding>  and I think yes but we need to work some things out about how everything fits together first
[15:36:26] oubiwann-hackday  nods
[15:36:46]  <@rvirding>  can I reply to that during the weekend
[15:36:54]  <@rvirding>  ?
[15:37:33]  <@rvirding>  and how we package stuff so it will be easy for people to get what they want so it all works
```

### Downloading, Dependencies, and Packaging

```
[15:38:00]  <oubiwann-hackday>   you're not happy/content with using rebar.config deps?
[15:38:16]  <@rvirding>  I don't know
[15:38:30]   troutwine is now known as troutwine_away
[15:38:33]  <oubiwann-hackday>   it has caused me a number of problems in the past
[15:38:46]  <oubiwann-hackday>   I use it for fewer and fewer things now
[15:38:57]  <@rvirding>  what if you don't want want to build one thing but want the whole environment?
[15:39:26]  <@rvirding>  as we get more stuff we are wandering towards an LFE system, similar to what elixir is doing
[15:39:41]  <@rvirding>  so how do we package it?
[15:40:01]  <@rvirding>  and make it easy to use when you do want to build a tool?
[15:40:06]  <oubiwann-hackday>   I was kind of hoping we could avoid packaging and just use github :-/ (or any URLs for dl'ing)
[15:40:32]  <oubiwann-hackday>   packaging is a *beast*
[15:40:42]  <@rvirding>  I mean packaging in a more generic sense
[15:40:50]  <oubiwann-hackday>   ah
[15:40:52]  <nox>    Noooooooooooo
[15:40:59] oubiwann-hackday  laughs
[15:41:02]  <nox>    Not just piggybacking GitHub, please.
[15:41:37]  <oubiwann-hackday>   nox: you mentioned something before about your preference, and I don't remember what that was... :-/
[15:41:49]  <nox>    The most painful one.
[15:41:49]  <oubiwann-hackday>   nox: if you type it again, I'll open a ticket and paste it there :-)
[15:41:51]  <@rvirding>  nox: do we write YAEPS (yet another erlang package system)?
[15:42:07]  <nox>    Multiple tools, written in Erlang, that don't give a shit to building.
[15:42:14]  <nox>    And only handle built artifacts.
[15:43:05]  <oubiwann-hackday>   nox: can you give an example usage scenario? I'm not quite following you ...
[15:43:10]  <@rvirding>  where I was going was that we have a basic LFE and we are getting more tools and libraries built around it
[15:43:26]  <nox>    oubiwann-hackday: Have a tool that manages BEAM installations.
[15:43:31]  <oubiwann-hackday>   ah
[15:43:36]  <oubiwann-hackday>   got it
[15:43:40]  <nox>    oubiwann-hackday: Have a package manager where build instructions are written in them.
[15:43:48] oubiwann-hackday  nods
[15:43:51]  <nox>    Have a tool that handles registration of installed applications
[15:44:06]  <nox>    and one that pulls the correct -pa paths for dependencies of a given application.
[15:44:17]  <nox>    Then, have as many build systems as you want, it's irrelevant.
[15:44:42]  <@rvirding>  how do we present it to users
[15:45:02]  <nox>    "The Orthogonal Tooling Manifesto"
[15:45:08]  <nox>    :D
[15:45:25]  <@rvirding>  they get everything? or do they get to choose but it is loaded into the "right place" so it works
[15:45:25]  <oubiwann-hackday>   TOToM
[15:45:39]   troutwine_away is now known as troutwine
[15:46:09]  <nox>    rvirding: What do you mean?
[15:46:17]  <nox>    oubiwann-hackday: Or just Orthogon, it's more confusing.
[15:46:26]  <oubiwann-hackday>   hehe
[15:46:41]  <nox>    I even have a logo!
[15:46:43]  <oubiwann-hackday>   nox: you don't want a totom (bad spelling) poll logo?
[15:47:11]  <oubiwann-hackday>   nox: let me guess: your logo is a Cartesian grid? ;-)
[15:47:33]  <@rvirding>  with erlang I must build a release which I then download, but the downloader can't control what they get
[15:47:33]  <nox>    oubiwann-hackday: ⊥
[15:47:39]  <oubiwann-hackday>   hahahaha
[15:47:41]  <oubiwann-hackday>   even better
[15:47:46]  <@rvirding>  nox: botton?
[15:47:47]  <oubiwann-hackday>   (I really lol'ed for that)
[15:47:50]  <@rvirding>  bottom?
[15:47:52]  <nox>    rvirding: Yes. :D
[15:48:00]  <nox>    Confusion up to 11.
[15:48:15]  <oubiwann-hackday>   *hilarity ensues*
[15:48:15]  <nox>    My vengeance for so many manifestos.
[15:49:02]  <@rvirding>  with elixir you get their full package, at least in 0.13
[15:49:24]  <nox>    Mmh.
[15:49:57]  <@rvirding>  I would like a system where you could say at download time which bits ("packages") you want and it downloads and puts them in the right place for you
[15:50:04]  <nox>    They have Mix, they will never use something else if it isn't proven to work first.
[15:50:15]  <nox>    rvirding: Already-built things?
[15:50:41]  <@rvirding>  yes but when you download elixir you get it all, what if I don't want if all?
[15:50:55]  <@rvirding>  at least you do with homebrew
[15:50:57]  <nox>    You are on your own.
[15:51:09]  <@rvirding>  yes already built stuff
[15:52:23]  <@rvirding>  similar idea to releases but without actually building a release
[15:52:50]  <@rvirding>  but then I have absolutely no idea if anyone actually wants it like this
```

### Removing the Dependency upon Rebar

```
[15:53:08]  <oubiwann-hackday>   rvirding: sounds like we could just keep everything in separate repos, then
[15:53:26]  <@rvirding>  but if you are using LFE to build tools then this would be good as you could take what you need
[15:53:43]  <oubiwann-hackday>   and let people update their rebar.config (or whatever, in the future) to include only what they want
[15:53:52]  <@rvirding>  we could keep them in separate repos but would need download tool
[15:54:34]  <oubiwann-hackday>   rvirding: git could be the first iteration of a download tool ...
[15:54:53]  <@rvirding>  I see rebar more for building a thing rather than an environment
[15:55:03]  <nox>    I would like some day to see something where tarballs are hosted somewhere and whatnot.
[15:55:22]  <oubiwann-hackday>   nox: yeah, I've been using github for that
[15:55:29]  <oubiwann-hackday>   release tag zip/tarballs
[15:55:46]  <@rvirding>  you would need the "tool" to make sure everything ends in the right place so it all just works
[15:56:27]  <oubiwann-hackday>   rvirding: so right now, the "right place" is just the ./deps dir relative to the project (rebar's influence)
[15:56:47]  <@rvirding>  like do we have a lib directory in the LFE tree where everything is installed and LFE knows where to find it
[15:57:22]  <@rvirding>  I think I am think more towards releases, but I am not a rebar person
[15:57:30]  <@rvirding>  thinking*
[15:57:37]  <oubiwann-hackday>   rvirding: in the pull request for merging lfeunit, there is a lib dir for all *.lfe files
[15:57:54]  <oubiwann-hackday>   and then a make target that compiles those to ./ebin
[15:58:14]  <@rvirding>  something like that yes
[15:58:33]  <oubiwann-hackday>   rvirding: the last two things I use from rebar are compiling dependencies and downloading dependency repos
[15:58:41]  <@rvirding>  but maybe separate direcories? I don't know
[15:59:26]  <oubiwann-hackday>   it would be pretty trivial to add support for these two use cases to lfetool
[15:59:32]  <@rvirding>  I see what the elixir tree looks like, but I have not looked at mix so I have no idea what it does
[15:59:41]  <oubiwann-hackday>   which would mean that you wouldn't have to use rebar :-)
[15:59:52]  <@rvirding>  +1
[16:00:09] oubiwann-hackday  creates two tickets
```

### Summary, Call for Discussion, Github Orgs Revisited, and Bootstrapping

```
[16:00:54]  <@rvirding>  anyway those were my thoughts
[16:01:48]  <@rvirding>  I want to eat my cake and keep it, both build releases and have separate things
[16:02:24]  <@rvirding>  but as I said I have no idea how others would prefer to have it so I want a discussion around that
[16:04:47]  <@rvirding>  then I am all for putting everything in one place like lfex
[16:06:38]  <oubiwann-hackday>   and core stuff in the lfe org?
[16:08:04]  <@rvirding>  that would be fine
[16:11:01]  <@rvirding>  I think that one problem with erlang is that it difficult to put together a collection of stuff unless you either build a release or use rebar.
[16:11:23]  <@rvirding>  ERL_LIBS works fine but it not really good
[16:11:54]  <@rvirding>  but what do people want? what will make nox happy? :-)
[16:12:18]  <@rvirding>  am I worried about a problem others don't have?
[16:14:10]  <oubiwann-hackday>   yeah, I see what you're saying now
[16:14:15]  <oubiwann-hackday>   I had that problem, as a user
[16:14:23]  <oubiwann-hackday>   that was the first thing that caused me to create lfetool
[16:14:45]  <oubiwann-hackday>   I needed something that could start my REPL up with all the right deps included automatically, with LFE included, etc.
[16:15:04]  <oubiwann-hackday>   a lot of the things you are asking for have been cobbled together with lfetool wrapping other things
[16:15:26]  <@rvirding>  maybe a core system including lfetool would be suitable
[16:16:03]  <@rvirding>  you would then use lfetool to down other "packages" into the right place so LFE will find them
[16:16:23]  <oubiwann-hackday>   in fact, so much work has gone into that, that it would really be not too much work to add the remaining bits ... bits that would break the dependency upon rebar and let lfetool be used stand-alone
[16:16:28]  <oubiwann-hackday>   yup
[16:16:33]  <oubiwann-hackday>   https://github.com/lfe/lfetool/issues?labels=enhancement
[16:16:41]  <oubiwann-hackday>   I just added those, based on this conversation
[16:17:40]  <oubiwann-hackday>   so, I don't think any of this makes nox happy, per se ... but there is a ray of hope for him: the rewrite of lfetool is 100% plugin-based, allowing anyone to write their own plugin in ~/.lfetool/plugins or to submit a PR for a new official plugin
[16:18:00]  <@rvirding>  yes, and yes
[16:18:03]  <oubiwann-hackday>   the the plugins approximate the combination of separate tools that he would like
[16:18:17]  <@rvirding>  but I have the feeling I am being difficult
[16:18:30]  <@rvirding>  :-)
[16:18:34]  <oubiwann-hackday>   the plugins will also have a behaviour, so there will be a standard way to do things
[16:19:00]  <oubiwann-hackday>   rvirding: I thought you might have been :-) but! I see now that you're expressing the same thing that I experienced that drove me to create lfetool in the first place
[16:19:13]  <oubiwann-hackday>   as a bash script, it self-admits to being a prototype and hack :-)
[16:19:36]  <@rvirding>  that would be good so we/oyu don't have to try and guess every tool anyone might be interested in
[16:19:59]  <oubiwann-hackday>   so I'm looking forward to a first "real" version that can attempt to solve these problems for LFE (and maybe offer a path of exploration for BEAM in general... I'm sure mix can offer some similar insights)
[16:20:09] oubiwann-hackday  nods
[16:20:10]  <oubiwann-hackday>   yeah
[16:20:17]  <@rvirding>  if it was part of core LFE then when you downloaded and installed it you could use it for everything outside the core
[16:20:26]  <oubiwann-hackday>   huh
[16:20:34]  <oubiwann-hackday>   I hadn't made that last connection
[16:20:34]  <@rvirding>  lfetool
[16:20:50]  <oubiwann-hackday>   that eliminates the bootstrapping problem ...
[16:20:54]  <oubiwann-hackday>   (or most of it)
[16:23:15]  <@rvirding>  yes, core LFE contains LFE itself, some stdlibs, and lfetool
[16:23:51]  <oubiwann-hackday>   in which case, "git clone" is the boostrap mechanism :-)
[16:23:57]  <@rvirding>  lfetool could then be used to load other LFE things and install them in the right place
[16:24:03]  <oubiwann-hackday>   or bootstrap, if you prefer good spelling
[16:24:08] oubiwann-hackday  nods
[16:24:29]  <oubiwann-hackday>   this is getting exciting :-)
[16:25:40]  <@rvirding>  either git clone or just having a tarball which you put somewhere and do make install
[16:26:36]  <@rvirding>  if the lfe, lfec, and lfescript commands work as hoped then installing would just be putting links in a bind directory
[16:27:04]  <@rvirding>  well compiling the erlang files as well of course, and some lfe files after that
[16:27:42]  <oubiwann-hackday>   yup
[16:27:56]  <oubiwann-hackday>   right, in which case the "bootstrap" is curl + tar
[16:27:59]  <oubiwann-hackday>   which is nice
[16:41:15] <@rvirding>	 you could even build the tarball directly from github
```
