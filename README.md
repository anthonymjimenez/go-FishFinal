# go-FishFinal
-- Created by Anthony Jimenez and Stacey Carrillo
This Go Fish game is an IPad only application. The rules of Go Fish are simple, both the dealer and player (you) gets seven cards. As the player you get to go first. You can ask the dealer for any card as long as the card you are asking for already exists in your hand. If the dealer has the card you are asking for then he has to give you all the cards in his hand that match the card you requested, you can keep asking for another card until you guess wrong (meaning the dealer does not have the card you are asking for) If you guess wrong, you draw a card from the top of the deck and it’s the dealers turn. The same rules apply, so if the dealer asks for a card you don’t have they draw a card and it becomes your turn. Once the deck runs out the player that has the most set of fours (four cards that are the same letter/number) wins. The game ties if the set of fours are equal between both players. We’ve also added money and betting to the game. You are allowed to bet a maximum of $100 dollars each turn with chips that are provided on screen. There are three different options in terms of the chips. They are valued at $10, $25, and 50$ Betting is not allowed during the runtime of animations (the cards moving). If you keep playing and your balance is lowered to zero the game will not allow you to bet, and each turn will begin automatically instead of waiting for you to bet. If you end a game with a balance of zero your balance is reset to the full starting amount for the next game. The dealer will always match your betting amount. All the chips are animated randomly into a container in the middle of the screen. Whoever wins at the end will have the chips animate towards them. We’ve added detailed comments on all the functions to give a better understanding of all the moving parts. We hope you enjoy our game! 


///You can bet each turn but you can only bet up to 100 a turn 
 
///You can not bet during animations 

////The game automatically starts dealing if your balance is zero 

///The game will not let you bet if your balance is zero during the game

////If your balance is zero after a game your balance gets reset 

///Each chip that you add is matched by the dealer

////Each chip value added to pot is also matched by dealer (ex. I add 100 - Dealer adds 100- Pot:200) 

////The chips are added randomly to money container 

//The chips are animated towards the winner of the round 
