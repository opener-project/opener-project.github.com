---
layout: default
title: Getting Started
sidebar: getting_started
---

# Design Decisions and Requirements

The OpeNER project started as an attempt to level the playing field for SMEs and
individuals wanting to use NLP technologies in their software products and
research of at least 6 European languages.

In order to achieve this goal a consortium was formed that contained the 3 most
important stakeholders: NLP Experts, Integrators and End-Users. It was conceived
that the resulting solution should try and enable all users to play to their
strengths.

* NLP experts want to contribute to the OpeNER ecosystem should be able to focus
  on their research and initial implementation. They should be able to implement
  their solution as they see fit with minimal boundaries and maximum quality.
* Developers and IT infrastructure experts, from heron called Integrators,
  should be able to integrate NLP components into standardized OpeNER
  components, provide installers, deployments, improve performance and
  scalability.
* End-users should be able to mix and match building blocks and
  focus on adding value to the interpretation of "raw" NLP analysis.

Developing an architecture that pleases at least 3 types of users is not
possible without making compromises, however, we tried to achieve maximum
freedom for all partners. The following subsections explain the challenges and
requirements of each stakeholder group in more detail

### NLP Expert Requirements

Right from the start of the OpeNER endeavor it was clear that, as in every
field, any choice of technologies, frameworks and procedures in the field of NLP
is highly opinionated. Java vs. Python, Gate vs. OpenNLP, Rule based vs. Machine
learned, XML vs JSON, while those debates are entertaining and, at times,
intellectually challenging they also clearly indicate that any architecture
trying to unify and standardize should not force researchers into the one or the
other. With every choice you make, you risk losing interest of a large group of
people.

The main requirements from an NLP Expert point of view therefore is that:

> NLP experts should not be limited in their choice of technologies.

Another requirement became apparent when trying to select a series of
technologies that would be able to perform named entity detection and opinion
detection in 6 European languages. There simply is not a single technology or
framework out there that suits all languages. Even for tasks that appear simple
for humans, software find challenges. For example, there is great software that
is able to split Spanish texts into paragraphs, sentences and words, but if you
apply that same software to English it's quality degrades drastically. The same
holds for the more complex tasks like detecting opinions and named entities.

Because of the language differences a second major requirement was formed. If
one want to be able to deliver multi-language NLP components:

> It should be possible to integrate several single or multi-language components into a larger multi-language component

It seemed apparent that in order to satisfy both the technology independence
requirement as well as the language independence requirements a layered
architecture was needed that complied with the more generic requirement that
would make it possible to mix and match technologies, programming and human
languages:

> Integration of technologies should be done at a "higher" level than the functional NLP level.

Combined these requirements should make sure that there is no reason for heated
debates between NLP experts, which, we hope, improves the adoption rate of the
OpeNER system in the research community.

### Integrators

Integrators are software and IT infrastructure experts that want to invest time
in wrapping technologies developed by the NLP experts into re-usable pieces of
software. Integrators can come from many background and are not necessarily
researchers or experts in the field of NLP. They do however know how to bundle
and ship working software.

In order to be able to integrate software of which one does not know the exact
details, there should be a certain baseline or standard to work upon. Standards
make that one does not need to know all the intricate details of the internals
of an NLP component. As in the real world different levels of "integration"
exist between components. Duct tape and tie wraps provide very nice integrations
when repairing just about anything in the physical world, however, most
situations call for better performing integrations like welding, screws or
velcro. The same applies for software integrations. The least we want
integrators to achieve, without a working knowledge of the actual NLP components
is a Duct tape & Tie Wrap integration. Therefore we define the following
requirement:

> Integrators should be able to achieve basic integration of NLP components without having to know about the internals of these components.

Once a basic integration has been implemented, one also needs to test if the
resulting software component still functions as intended by the original author.
In order to do this, again, without the need to know about the details of the
NLP component testing needs to be standardized. Therefore the next requirements
to the OpeNER system is that:

> There should be a standard way of testing if components are working as intended

By defining integrators as a separate stakeholder we hope to involve people that
are not normally part of the NLP core community. This would broaden the skills
available to the community en-large and will in the long run lead to an increase
in usage of NLP systems, and therefore to an increase in overall attention and
progress of the NLP field.

### End-Users

Next to the NLP Experts and integrators we have the end-users that want to
install and use NLP components to conduct a certain analysis or develop an
application on top of the results of NLP pipelines, for example: Social Media
Mood Maps, Political Analysis or Patent searches to name a few applications of
NLP pipelines. We define end-users as the software developers that get the tasks
to build something on top of NLP technology, be it on top of intermittent
results in a pipeline or on top of the results of a full pipeline.

The main requirements that shaped the design of the OpeNER system are: Gradual
Stiffening, versioned installs, scalability and the possibility to use a mix of
proprietary and open source software. Each of these requirements is explained in
more detail below.

#### Gradual Stiffening

Gradual stiffening refers to the property of a software system or framework that
allows users to start quickly and without much effort and then slowly and
gradually explore the more advanced options. Examples of systems that stiffen
gradually are the operating system on your computer and the popular word
processing applications. In both cases you can start as a novice user and become
an expert user over time.

The type of gradual stiffening we try to achieve with the OpeNER system is
similar in the sense that we would like to have users to start using the system
without having to install anything. This can for example be achieved by offering
free tier web-services.

Another aspect is that the stiffening should be _gradual_, in a sense that you
can take small steps towards becoming an expert. We envision that our users will
learn along the way and that sooner or later the need arises to grow and extend
the system with extra components and functionalities.

#### Packaged Versioned Installs

One of the major problems as conceived by both the business and academic
partners in the OpeNER consortium is the lack packaged versioned installs of NLP
tools. By packed versioned installs we mean that one can install a single
version of a single software package, and trust that package to be the same now,
2 weeks from now or even 3 years from now.

Businesses depend on installation packages being stable in their install
process. Nothing is as frustrating as being able to install a certain software
package on 1 server and not on another, identical server, 1 week later. It's not
uncomment to have a lot of time gets lost trying to figure out all the software
dependencies and their versions. Time that could also be spent implementing
actual features or applications.

For a research perspective the packaged versioned installs might even be more
important. As a researcher is has been proven very difficult if not next to
impossible to reproduce results from identical NLP pipelines as they are
reported in publications. One of the reasons this is so difficult is because of
the stacked nature of NLP pipelines. Changes in fundamental components as a
tokenizer or pos-tagger propagate all throughout the pipeline. Therefore,
changes in these components, even very minor ones, actually do have an effect on
the final results. This problem is not easy to solve in an efficient way but
OpeNER attempts to at least diminish the problematic effects by requiring that
any OpeNER component should as much as possible ship with a clear version number
and its external dependencies included.

#### Scalability over raw performance

Not everybody wants to, or is capable of writing high performance computer code.
When your goal is to innovate and improve the state-of-art of language
technologies, performance will not always be a top priority. Because of this raw
performance will not be put forwards as an end user requirement. However, this
does not mean that performance in general is not a major concern.

Both in research and in business contexts it is often more important to know how
much time it would take to process a set of documents then to know that it's
done in the fastest possible way. We therefore deem predictable performance as
more important than raw performance.

The easiest kind of predictable performance to achieve is linear performance.
Which basically means if 1 computer can process x documents per minute, then 10
computers can do 10x documents per minute. Using current cloud computing
technologies as offered by providers like Amazon and Rackspace this means one
can always "buy speed" by simply launching more computers.

In order to achieve linear scalability one has to consider how processes in a
pipeline communicate with each other, and, referring back to the packaged
versioned install requirement, one has to be sure that launching multiple
computers is as easy as possible and doesn't require a lot of hassle on each
installation.

#### Mix of Proprietary and Open Source use

In order not to scare way small, medium and large enterprises it has to be
possible to combine freely available open source components with proprietary
installations and improvements. Of course hope that the users of OpeNER
compatible components will give back to the overall community as well, but we
are of the opinion that if somebody wants to use OpeNER components as part of a
proprietary setup that this should be possible.

This requirement is in line with the gradual stiffening requirement where
companies can start using OpeNER technologies using the free web-services and
will slowly grow into their own technologies when the initial systems don't
offer enough capabilities.

To conclude this section we'd like to note that the stakeholder groups and
requirements defined above are not mutually exclusive. Researcher in their role
of NLP experts can deliver core technology for certain tasks, but they will be
end-users of components of others at the same time. The same is true for
integrators, which will not only have to support their own integrations, but
also make sure that it works with the integrations of others. The next section
explains the core concepts of the architecture designed with the just presented
requirements in mind.

## Where to go from here

Based on the arguments presented above we designed the OpeNER architecture which
is presented at the [OpeNER Architecture
page](/getting-started/architecture-overview.html). You might also be interested
in some of the more extensive narratives on the project. You can find those in
the [Deliverables Section](http://localhost:4000/project/publications.html).

