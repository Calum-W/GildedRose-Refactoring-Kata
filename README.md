Gilded Rose Tech Test
===============

This repo was created as a practice tech test in week 10 of Makers' Academy.

### Acceptance criteria

This tech test is based on a kata by Terry Hughes. The instructions are as follows:

*"Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime location in a prominent city run by a friendly innkeeper named Allison. We also buy and sell only the finest goods. Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We have a system in place that updates our inventory for us. It was developed by a no-nonsense type named Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that we can begin selling a new category of items. First an introduction to our system:

All items have a SellIn value which denotes the number of days we have to sell the item. All items have a Quality value which denotes how valuable the item is. At the end of each day our system lowers both values for every item. Pretty simple, right? Well this is where it gets interesting:

Once the sell by date has passed, Quality degrades twice as fast
The Quality of an item is never negative
“Aged Brie” actually increases in Quality the older it gets
The Quality of an item is never more than 50
“Sulfuras”, being a legendary item, never has to be sold or decreases in Quality
“Backstage passes”, like aged brie, increases in Quality as it’s SellIn value approaches; Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but Quality drops to 0 after the concert
We have recently signed a supplier of conjured items. This requires an update to our system:

“Conjured” items degrade in Quality twice as fast as normal items
Feel free to make any changes to the UpdateQuality method and add any new code as long as everything still works correctly. However, do not alter the Item class or Items property as those belong to the goblin in the corner who will insta-rage and one-shot you as he doesn’t believe in shared code ownership (you can make the UpdateQuality method and Items property static if you like, we’ll cover for you)."*


### Solution
To begin, I spent some time reading through the update_quality method, and visualised the changes happening by creating a logic tree for each type of item. Upon doing this, it became immediately apparent that polymorphism would be the ideal solution to the problem, and that by creating separate classes for each item type, I could simply have update_quality call update_quality on each item in the array.

Before refactoring the code, I began writing tests categorised by the type of item. Only after I believed I had covered all edge cases did I begin changing the code itself.

I created one class at a time, replicating the tests in a new file then writing code to match. Once all of my classes were passing their tests I changed GildedRose's update_quality method to use polymorphism.

After doing this, I continued to refactor by making changes which had now become more apparent. Each type of item could inherit their initialize and to_s methods from the Item class, and the Legendary class (created for Sulphuras) was no longer necessary.

Despite the instructions that the Item class should not be altered, I decided to risk the ogre's wrath by making two small additions to the code. An empty update_quality method, which allowed me to remove the Legendary class (as it followed the parent class logic), and a MIN/MAX_QUALITY constant, which had no effect on the code but would make future changes easier to implement.

Given more freedom to change the Item class, I would also have added the following method, and called it at the end of each subclass item's update_quality method:

@sell_in -= 1
@quality = MIN_QUALITY if @quality < MIN_QUALITY
@quality = MAX_QUALITY if @quality > MAX_QUALITY
