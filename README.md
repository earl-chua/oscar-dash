# Academy Award Big Eight Ballot Dashboard

## About the Application

How do you predict the Academy Awards? There is plenty of information available beforehand, but it's hard to organize them together (not as hard as an NCAA bracket).
Most ballots rely on hunches, can be susceptible to recency bias (<i>"They won the BAFTAs so..."</i>), and may boil down to a form of wishcasting. A way to correct
this is to add some structure, and one way to add structure is to look at some strategies people use to fill up their ballots.

Strategies vary from simply tracking other awards shows to looking at analytical models, and this application is a way to see how well you would've done
 retroactively, year on year. At this current iteration, you get to see how the strategies have performed. Future iterations could include leaderboards, where users
 submit their predictions <i>before</i> the Oscars and get evaluated after the fact. In putting this together, hopefully users gain a better sense of how 
 awards voters make their picks, do better in their Oscar pools, and stop being shocked at otherwise-"predictable" results. 

## Current Functionality

The current version has two areas of interest. The first is an overview of Oscar winners and common strategies, as well as their historical track records. The 
winners go all the way from the first ceremony in 1929. The track records go back to around 2003, when the Big Eight categories are in their current names.
Some strategies have shorter histories because they're new. It provides the user a look at how much information has been extracted by forecasters 
in finding out who wins cinema's biggest awards.

The second is ballot creation. You set the year you want to vote on at the homepage, through which you are redirected to a full ballot. You vote on all
eight categories, and upon submission, your ballot is recorded. You can see your ballots on the "Your Ballots" page, as well as everyone else's in the 
"All Ballots" page. In these pages, you can click "Show details" to see what the votes are for, and how they compare to common strategies.

In order to keep track of predictions, a user must sign in to submit a ballot and evaluate . At the moment, the ballots are retroactive and you get to backtest
ideas you have.

## Future Improvements

 1. More details on the nominees.
 1. More strategies.
 1. Other ways to evaluate performance, taking into account implied probabilities.
 1. Shore up the category lists to account for name changes.
 1. Trickle in the other categories.
 1. Category-level and aggregate analysis.
 1. A form for future Oscar ceremonies: users submit before the ceremony, then get evaluated after it.

## Standard Workflow

 1. Start the web server by running `bin/server`.
 1. Navigate to your live application.
 1. There is an existing username `John_Doe` with password `john` worth looking at, if you want to dig deeper.
