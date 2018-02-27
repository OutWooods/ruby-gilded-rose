# Gilded Rose Tech test

## Scenario
Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a prominent city run by a friendly innkeeper named Allison. We also buy and sell only the finest goods. Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We have a system in place that updates our inventory for us. It was developed by a no-nonsense type named Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that we can begin selling a new category of items. First an introduction to our system:

All items have a SellIn value which denotes the number of days we have to sell the item. All items have a Quality value which denotes how valuable the item is. At the end of each day our system lowers both values for every item. Pretty simple, right? Well this is where it gets interesting:


## Rules
#### How Quality Value and Sellln value are calculated
Once the sell by date has passed, Quality degrades twice as fast

The Quality of an item is never negative

“Aged Brie” actually increases in Quality the older it gets

The Quality of an item is never more than 50

“Sulfuras”, being a legendary item, never has to be sold or decreases in Quality

“Backstage passes”, like aged brie, increases in Quality as it’s SellIn value approaches;

Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert (aka when sell in = 0)

*Clairifcations of edge cases*
Since there are several edge cases, these understand extra (possible) rules:

Sulfras' sell_in never changes

Food that is off, but has a quality of 1, should go down to 0

Brie increases in quality by twice as much when it is passed sell in

Backstage go up by 1 when sell in is +1 



####What you can change
 - Don't alter the Item class or Item's property
 - You can update the quantity method

## Approach
  - Solve a simpler problem first, and gradually add complexity. (So focus on the first rule. Solve that, then build up.)
  - Test first and don't 'improve' untested code
  - Take it slow, small incremental changes
  - Really understand the code before making changes

## Targets
  - Take it slow, change minimal amounts
  - Tests always focus on behaviour
  - Leave code better than I found it

## Feedback points
Things I am particularly keen to improve (do give me feedback on any other aspect too)
  - Have I communicated what I've done well? (E.g. commit messages, method/variable names.
  - Do you see any steps where I jumped too fast?
  - Keeping my methods short, and responsibilities clear


## Tech
  - rspec
  - ruby
