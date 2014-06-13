## Conversation on IRC

I've been wrestling with the cumbersome nature of lfetool being a fairly large
shell script for a while now. The conversation below pushed me over the edge,
falling into the abyss of Version 2:


[08:35:16]  <mheise>	 oubiwann-fn: did anyone start work on addressing the bashisms yet btw?  i'll have a little free time next week, if nobody's done the work yet i can give it a crack
[08:35:44]  <oubiwann-fn>	 mheise: not yet..
[08:35:58]  <oubiwann-fn>	 and I fear the latest changes may be working at cross-purposes
[08:36:39]  <mheise>	 how so?
[08:37:08]  <oubiwann-fn>	 I suspect that some people's recent pull requests might have stomped on previous pull requests
[08:37:39]  <oubiwann-fn>	 with regard to shell tweaks/changes -- I don't have anything more specific than that
[08:37:58]  <oubiwann-fn>	 also: I want to make sure that things still continue to work (e.g., coloring) as we generalize for wider support of shells
[08:38:12]  <mheise>	 sounds reasonable.
[08:38:17]  <oubiwann-fn>	 this has got me re-thinking lfetool implementations ...
[08:38:29]  <oubiwann-fn>	 for instance, what would a bootstrapping solution look like?
[08:39:10]  <mheise>	 is an approach where we test which shell we're running under feasible? or does code fragmentation (for lack of a better term) make that not worthwhile
[08:39:27]  <oubiwann-fn>	 a shell script that downloads lfe, (maybe installs it to ~/.lfetool/lfe?), and then replaces itself with an lfe script that does everything we want
[08:39:56]  <oubiwann-fn>	 hrm... I may have already talked myself into this!
[08:40:03]  <mheise>	 haha
[08:40:23]  <oubiwann-fn>	 I guess lein does this
[08:40:27] oubiwann-fn	 checks on that
[08:40:53]  <mheise>	 is lein the clojure build tool?
[08:41:01]  <oubiwann-fn>	 yeah, build and so much more
[08:41:18]  <oubiwann-fn>	 Elixir's mix and lfetool are both inspired by it, to different degrees
[08:41:47]  <mheise>	 <Duncan "Billy Mays" McGregor> and so much more
[08:41:49]  <mheise>	 heh
[08:41:57]  <oubiwann-fn>	 hahaha
[08:42:31]  <oubiwann-fn>	 hrm, so it looks like lfe isn't just a bootstrapper
[08:43:53]  <oubiwann-fn>	 it does do bootstrapping, but it sticks around and wraps calls to lein
[08:46:50]  <oubiwann-fn>	 lein provides a compatibility layer for different OSes/shells
[08:47:03]  <oubiwann-fn>	 that seems like the right level of responsibility to a tool like this
[08:47:36]  <oubiwann-fn>	 and then pass everything else off to lfe code and the appropriate plugins
[08:47:53]  <oubiwann-fn>	 mheise: okay, I'm getting more and more convinced now
[08:48:13]  <oubiwann-fn>	 mheise: here's where I could use your help + expertise:
[08:49:25]  <oubiwann-fn>	 a new version of lfetool that is a shell wrapper supporting bash, zsh, dash, cygwin, etc., that makes calls to erlang
[08:50:09]  <oubiwann-fn>	 we can call it lfetool2 for now -- we'll do a rename once everything is proven to be 100% feature complete (compared to the existing lfetool)
[08:50:57]  <mheise>	 i don't have a great surplus of expertise, but i can offer help when i get a bunch of tuits next week :)
[08:51:19]  <oubiwann-fn>	 sweet
[08:51:20]  <oubiwann-fn>	 I will focus on creating the lfe libraries that will be eval'ed by erl in lfetool2 (importing arbitrary lfetool libraries to accomplish plugin-specific tasks)
[08:52:01]  <oubiwann-fn>	 I think it's time to set up an etherpad instance etherpad.lfe.io :-)
[08:52:18]  <oubiwann-fn>	 I'll paste these notes there and reference them in a new ticket
[08:52:25]  <oubiwann-fn>	 and create a new branch for this :-)
[08:53:43]  <mheise>	 cool!

## Notes from Ticket for Version 2 Development

In a conversation on IRC, I managed to talk myself (pretty easily/quickly, tbh) into a Version 2 implementation of ``lfetool``. It will follow more closely the ``lein`` tool which inspired it in the first place:
 * there will be a shell script named ``lfetool`` which will
   * bootstrap itself when first run
   * provide a compatibility layer for different shells and OSes
 * most of the functionality of ``lfetool`` will be moved into LFE library files
 * there will be an entry-point (probably written in LFE) which will dispatch to lfetool plugins (library files)
 * the entry-point will be called from the ``lfetool`` shell script (probably using @rvirding's new ``lfe`` script + parameter handling)

Inspiration will be taken from ``lein``: https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein

Work on this will be done in the ``develop`` branch: https://github.com/lfe/lfetool/tree/develop

The IRC conversation which inspired this ticket is saved here: https://github.com/lfe/lfetool/blob/develop/doc/notes/version2-dev-plan.md

The ticket for tracking Version 2 development (and all related tasks/sub-tickets) is here: https://github.com/lfe/lfetool/issues/46
