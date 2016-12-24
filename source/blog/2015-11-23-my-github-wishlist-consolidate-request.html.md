---
title:	'My GitHub Wishlist: Consolidate Request'
author: "Wojciech Adam Koszek"
description: >
  We all love fork and merge in GitHub, but what I think would be both hard
  to implement and very beneficial for the Open Source community is:
  consolidate. In this post I talk about how I'd like it to work.
address: "Menlo Park, CA"
tags:
- "tools"
read:	2015-11-29
published: true
ads:
- 
spellcheck-allow:
- "SourceForge"
- "de"
- "workspace"
- "JIRA"
- "npm"
- "jira"
- "jiracmd"
- "jilla"
---


If you develop any sort of software nowadays sooner or later you’ll end
up on [GitHub](https://github.com/). On one side a business, on the
other: great part of the Open Source world. I’d claim that GitHub was an
integral part of the distributed software development revolution. For
me, GitHub is the first source of contact if I want to see who already
wrote software bits I need for my next project.

[Git](https://git-scm.com/) and GitHub dominate today, since they’re
basically so much better than anything else. When I started to work on
software, most of the projects used [CVS](http://www.cvs.com/) or
[Subversion](https://subversion.apache.org/), and while they had some
pros (an ability to fetch only some project’s directories) the cons were
many. Nowadays everybody is migrating to Git or Mercurial, and old
services such as [SourceForge](http://sourceforge.net/) or [Google
Code](https://code.google.com/) are becoming more of a ghost sites
(Google de-featured Google Code already).

When asked, I’d say an ability to [fork a
repository](https://help.github.com/articles/fork-a-repo/) on GitHub
was probably on the top of list of features that made is so popular. It
takes a second to make someone’s repository your own by making a fork
(copy) and being able to play with the code safely in your workspace.
Whatever you do with the cloned project is fine, since it doesn’t impact
its original source project. It is your private sandbox, in which you’re
free to break all the toys. In other words: the source code becomes
truly yours.

The thing which I greatly miss is: “consolidate”. But when would
consolidate be useful?

When two authors fork the project in GitHub one can see where certain
bits came from. On the other hand, when authors just take the source
code and commit it under one name or simply rename the projects, it
starts to be harder to say what came from where. I experienced that on
numerous occasions, e.g.: when trying to find JIRA command line client
for example. In the [npm repository](https://www.npmjs.com/) there
exists “jira”, “jiracmd”, “jira-cli” and “jilla”, which all seem to be
copies with one another. Each command’s functionality is different, and
every one of them missed the functionality of another one. In such
cases, scripting with these tools is basically impossible, unless you
want your scripts to look like Frankenstein’s kids. GitHub seems to be a
great place to make such suggestions and one could hope authors would
take “consolidate” requests as seriously as pull requests. Consolidate
would come in the form of merge-conflict, which upon resolving, could
result in 2 projects merging.

Your “name of the project” has 98% similarity ratio to project “X”. Generate consolidate request? 
--------------------------------------------------------------------------------------------------

It would be great if as an author I could generate these consolidate
requests for forks of my repositories, so that I could actually make my
projects better with other people changes.

Another issue is that once you’ve forked and contributed some changes
back to the project, it’s likely your copy of the repository would be
lying there forever. GitHub should remove these old forks, so that the
“fork” count would show projects being actively maintained.

You’ve forked the project X days ago but haven’t made changes in the last 60 days. This fork will be removed after 30 days.
---------------------------------------------------------------------------------------------------------------------------

The success of the project and project’s popularity is often counted as
the number of stars (thumbs up) and number of fork. In the “consolidate”
world, we could add “rot” content ratio: if your project is more
consolidated and grabs available contributions from its forks, it’d get
a better score.

What is the feature you’d like to see in GitHub?
