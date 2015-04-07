== First to Disclose

**What is FirstToDisclose?**  FirstToDisclose.net is a community-powered online repository and application for inventors to disclose their inventions and other innovations to the public.  The project was concieved at Brooklyn Law School and has been incubated at the MIT Media Lab since the Code for America "CodeAcross" civic hackathons held in March, 2015.  

**What is the Function and Purpose of this Project?** The application is intended to support broadscale innovation by enabling better opportunities for open, free sharing of inventions and generally by facilitating ["idea flow"](http://socialphysics.media.mit.edu) in the Social Physics sense of the phrase.  The project is making innovating use of tags and federated identity. This project is also being augmented to better support the ABA-MIT Online Legal Appathon happening in conjunction with ABA TECHSHOW.   More information on this online event can be found at [LegalAppathon.com](http://LegalAppathon.com). 

**What do I Need to Know to Contribute?**  The FirstToDisclose code-base was refactored into a Rails App, housed and developed in this GitHub repository, by a team of volunteer civic hackers who meet at MIT weekly (or more often) to move the project forward.  Weekly project collaboration working meetings are generously hosted (with Pizza!) by the Code for America Boston Brigade, at the Cambridge Innovation Center on Tuesday evenings.  The project is primarily organized using Slack and GitHub issues.  In addition to the files, issues and wiki in this GitHub repository, see the FirstToDisclose.info and law.MIT.edu/FirstToDisclose sites for more information on the project.


== Setup

* Ruby version: 2.x

* Environment

  cp config/application.sample.yml config/application.yml

* System dependencies: Postgres

* Database initialization

  rake db:create

* How to run the test suite

  rake

* Deployment instructions

  heroku login

  git push heroku master
  heroku run rake db:migrate

  heroku config:add GITHUB_KEY=${FB_ID} --remote test
  heroku config:add GITHUB_SECRET=${FB_SECRET} --remote test

== About

{<img src="https://codeclimate.com/github/FirstToDisclose/firsttodisclose.net/badges/gpa.svg" />}[https://codeclimate.com/github/FirstToDisclose/firsttodisclose.net]
