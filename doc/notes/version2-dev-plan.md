## Conversation on IRC

I've been wrestling with the cumbersome nature of lfetool being a fairly large
shell script for a while now. The conversation below pushed me over the edge,
falling into the abyss of Version 2:

```
[08:35:16]  <mheise>    oubiwann-fn: did anyone start work on addressing the bashisms yet btw?
                       i'll have a little free time next week, if nobody's done the work yet i can give it a crack
[08:35:44]  <oubiwann-fn>     mheise: not yet..
[08:35:58]  <oubiwann-fn>     and I fear the latest changes may be working at cross-purposes
[08:36:39]  <mheise>     how so?
[08:37:08]  <oubiwann-fn>     I suspect that some people's recent pull requests might have stomped on previous pull requests
[08:37:39]  <oubiwann-fn>     with regard to shell tweaks/changes -- I don't have anything more specific than that
[08:37:58]  <oubiwann-fn>     also: I want to make sure that things still continue to work (e.g., coloring) as we generalize for wider support of shells
[08:38:12]  <mheise>      sounds reasonable.
[08:38:17]  <oubiwann-fn> this has got me re-thinking lfetool implementations ...
[08:38:29]  <oubiwann-fn> for instance, what would a bootstrapping solution look like?
[08:39:10]  <mheise>      is an approach where we test which shell we're running under feasible? or does code fragmentation (for lack of a better term) make that not worthwhile
[08:39:27]  <oubiwann-fn> a shell script that downloads lfe, (maybe installs it to ~/.lfetool/lfe?), and then replaces itself with an lfe script that does everything we want
[08:39:56]  <oubiwann-fn> hrm... I may have already talked myself into this!
[08:40:03]  <mheise>      haha
[08:40:23]  <oubiwann-fn> I guess lein does this
[08:40:27] oubiwann-fn    checks on that
[08:40:53]  <mheise>      is lein the clojure build tool?
[08:41:01]  <oubiwann-fn> yeah, build and so much more
[08:41:18]  <oubiwann-fn> Elixir's mix and lfetool are both inspired by it, to different degrees
[08:41:47]  <mheise>      <Duncan "Billy Mays" McGregor> and so much more
[08:41:49]  <mheise>      heh
[08:41:57]  <oubiwann-fn> hahaha
[08:42:31]  <oubiwann-fn> hrm, so it looks like lfe isn't just a bootstrapper
[08:43:53]  <oubiwann-fn> it does do bootstrapping, but it sticks around and wraps calls to lein
[08:46:50]  <oubiwann-fn> lein provides a compatibility layer for different OSes/shells
[08:47:03]  <oubiwann-fn> that seems like the right level of responsibility to a tool like this
[08:47:36]  <oubiwann-fn> and then pass everything else off to lfe code and the appropriate plugins
[08:47:53]  <oubiwann-fn> mheise: okay, I'm getting more and more convinced now
[08:48:13]  <oubiwann-fn> mheise: here's where I could use your help + expertise:
[08:49:25]  <oubiwann-fn> a new version of lfetool that is a shell wrapper supporting bash, zsh, dash, cygwin, etc., that makes calls to erlang
[08:50:09]  <oubiwann-fn> we can call it lfetool2 for now -- we'll do a rename once everything is proven to be 100% feature complete (compared to the existing lfetool)
[08:50:57]  <mheise>      i don't have a great surplus of expertise, but i can offer help when i get a bunch of tuits next week :)
[08:51:19]  <oubiwann-fn> sweet
[08:51:20]  <oubiwann-fn> I will focus on creating the lfe libraries that will be eval'ed by erl in lfetool2 (importing arbitrary lfetool libraries to accomplish plugin-specific tasks)
[08:52:01]  <oubiwann-fn> I think it's time to set up an etherpad instance etherpad.lfe.io :-)
[08:52:18]  <oubiwann-fn> I'll paste these notes there and reference them in a new ticket
[08:52:25]  <oubiwann-fn> and create a new branch for this :-)
[08:53:43]  <mheise>      cool!
```

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

## Plugin Commands

Format:

```bash
  $ lfetool <command> <plugin> [<sub1> [<sub2> ...]] [<arg1 [args2 [arg3 ...]]]
```

### Current commands with no plugins

#### No sub-commands

```bash
  extract
  help
  version
```

#### One sub-command

```bash
  info bindir
  info erllibs
  info installdir
  info path
  info version
  install autocomplete
  install erjang
  install expm
  install kerl
  install lfe
  install lfetool
  install rebar
  install relx
  repl erlang
  repl lfe
  repl jerl
  repl jlfe
  tests all
  tests build
  tests integration
  tests system
  tests unit
  update deps
  update lfetool
```

### Current commands with plugins

#### No sub-plugins

```bash
  new library <name>
  new presentation <name>
  new script <name>
  new service <name>
  new yaws <name>
```

#### One sub-plugins

```bash
  new yaws bootstrap <name>
  new yaws default <name>
```

### Analysis

We should be able to unify these. Perhaps something along these lines:

* two kinds of plugin:
  1. command plugin
     * executes a command
     * formats:
       * ``<command>``
       * ``<command> <plugin-name>``
  1. skeleton plugin
     * generates files
     * accepts/requires parameter(s)
     * formats:
       * ``<command> <plugin-name> <param>``
       * ``<command> <plugin-name> <plugin-sub-type> <param>``

## Designing a Plugin System in LFE/OTP

### First thoughts

* put source files in ./plugins/<name> directories
* have a custom make target that compiles them to ./ebin
* register each plugin with the commands it supports
  * scan the plugins directory
  * extract plugin name from directory/module - get-name
  * extract the help text from each plugin module - get-help
  * extract the supported commands from each plugin - get-commands
  * extract the supported sub-commands for each command - get-subcommands
* define an OTP behaviour for these plugins

### Notes from an email to the LFE mail list

I've been making progress prototyping the new lfetool. I've got a very basic
system in place that exercises the following flow:

```
  command from system shell -> eval fn -> parse fn -> dispatch fn
```

where the "dispatch function" will make a call to a function in the plugin
module, as identified during the parse phase.

Next I'm going to experiment with the dispatching, with an eye towards making
it as easy as possible for new plugins to be created by contributors. lfetool
will search for plugins in a standard dir (part of the lfetool source), but
will also search in ~/.lfetool/plugins so that users can create their own
plugins without submitting them for inclusion in lfetool proper, if they so
choose.

This has, however, brought up a bit of an interesting problem to solve, with
regard to the lfetool "architecture", and it hinges upon making things as
simple as possible for plugin developers. As we all know, when one attempts
to make things simple for users, software gets *very* complicated ;-)

Sought simplicity:
 * users should be able to create a plugin module and any associated
   template files in one location
 * users should be able to have commands for their plugins accessible via
   lfetool
   * for example, I create a plugin that adds support for generating Garrett
     Smith's e2 service
   * lfetool new should have a new subcommand called e2 (or whatever I name
     it)
 * the bash auto-complete should be easily/automatically updated with this
   addition
 * lfetool help should automatically list all official plugins as well as
   ones added by users
 * lfetool should support getting help/docs for individual plugins
 * lfetool code should be able to introspect each plugin and get plugin
   name, version info, supported commands, help, etc.

Subsequent complexity:
 * the lfetool project should create and document a behaviour for plugin
   modules
 * in order for all the introspection to work, lfetool will need to be
   "aware" of all plugins and all commands which they support
 * as such, I'm planning on creating a process which does the following:
   - gets a list of all plugins, official and user-created
   - builds a data structure for each plugin (possibly storing in ETS)
   - listens for a message, which will dispatch to a plugin function
 * this same infrastructure will also be able to auto-generate shell auto-
   complete files

Let me know if there are better ways to do this sort of thing using more
standard Erlang/OTP idioms ...
