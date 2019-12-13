//import SpriteKit
// Anthony Jimenez & Stacey Carrillo 'if you cant count cards you can atleast count instances'
import GameplayKit


class GameScene: SKScene {

let moneyContainer = SKSpriteNode(color: .clear, size: CGSize(width:250, height: 150))
    
let dealBtn = SKSpriteNode(imageNamed: "deal")
let hitBtn = SKSpriteNode(imageNamed: "Hit1")
let nextBtn = SKSpriteNode(imageNamed: "next")
let resetBtn = SKSpriteNode(imageNamed: "reset")
let beginBtn = SKSpriteNode(imageNamed: "start " )
let aceBtn = SKSpriteNode(imageNamed: "btnA")
let SecondBtn = SKSpriteNode(imageNamed: "btn2")
let ThirdBtn = SKSpriteNode(imageNamed: "btn3")
let FourBtn = SKSpriteNode(imageNamed: "btn4")
let FifthBtn = SKSpriteNode(imageNamed: "btn5")
let SixBtn = SKSpriteNode(imageNamed: "btn6")
let SevenBtn = SKSpriteNode(imageNamed: "btn7")
let EigthBtn = SKSpriteNode(imageNamed: "btn8")
let NineBtn = SKSpriteNode(imageNamed: "btn9")
var dealCount = 36
let dealerCard = Card(suit: "card_front", value: 0)
    let money10 = Money(moneyValue: .ten) //enum of Money check out Money.swift
    let money25 = Money(moneyValue: .twentyFive)
    let money50 = Money(moneyValue: .fifty)
    let moneyText = SKLabelNode(text: "")
    let pot = Pot()

    // foldbtn  - need fold image
let instructionText = SKLabelNode(text: "Press deal to begin!")
    
let userFourText = SKLabelNode(text: "")
let deckText = SKLabelNode(text: "")
let dealerHandText = SKLabelNode(text: "0")
let dealerFoursText = SKLabelNode(text: "0")
var allCards = [Card]() //The allCards array will be used to hold all the cards within the game ? may need to modify for THoldEm
let dealerCardsY = 930 // Y position of dealer cards
let playerCardsY = 230 // Y position of player cards
let communityCardsY = 530
    let player1 = Player(hand: Hand(), bank: Bank())
let communityHand = Hand()
let dealer = Dealer(hand: Hand()) // change to player type?
var communityCardsStarted = false;
var communityCardCount = 0
var cardsWereDrawn = false;
var noMatches = true;
    var successfulOnce = false;


    var currentPlayerType:GenericPlayer = Player(hand: Hand(), bank: Bank())  // can be either dealer or player1 some logic
                // is predicated on this
  //  current player nonsense might have less revelence in the new game
    let deck = Deck()
    
    override func didMove(to view: SKView) {
        setupTable()
        setupMoney()
        setupButtons()
        currentPlayerType = player1
    }
    
    func setupTable(){ // sets up our elements that will either animate or change text
        let table = SKSpriteNode(imageNamed: "gameTable")
        
        addChild(table)
        table.position = CGPoint(x: size.width/2, y: size.height/2)
        table.zPosition = -1
        addChild(moneyContainer)
        moneyContainer.anchorPoint = CGPoint(x:0, y:0)
        moneyContainer.position = CGPoint(x:size.width/2 - 125, y:size.height/1.6)
        
        moneyText.fontColor = UIColor.black
        moneyText.fontSize = 40
        addChild(moneyText)
        moneyText.position = CGPoint(x: size.width/2, y: 300)
        
        instructionText.fontColor = UIColor.black
        instructionText.fontSize = 60
        addChild(instructionText)
        instructionText.position = CGPoint(x: size.width/2, y: 550)
        
        deckText.fontColor = UIColor.black
        addChild(deckText)
        deckText.fontSize = 40
        deckText.position =  CGPoint(x: 350, y: 120)
        deckText.text = "0"
        
        userFourText.fontColor = UIColor.black
        addChild(userFourText)
        userFourText.fontSize = 40
        userFourText.position =  CGPoint(x: 730, y: 122)
        userFourText.text = "0"
        
        dealerHandText.fontColor = UIColor.black
        addChild(dealerHandText)
        dealerHandText.fontSize = 40
        dealerHandText.position =  CGPoint(x: 410, y: 855)
        dealerHandText.text = "0"
        
        dealerFoursText.fontColor = UIColor.black
        addChild(dealerFoursText)
        dealerFoursText.fontSize = 40
        dealerFoursText.position =  CGPoint(x: 494, y: 973)
        dealerFoursText.text = "0"
        
        deck.new() // new deck instance
        
        
    }
    func setupMoney(){ // add child is ness for adding elements to the scene
           // this adds the money instances and sets their position
              
            addChild(money25)
            money25.position = CGPoint(x:130, y:40)
                
               addChild(money50)
               money50.position = CGPoint(x: 185, y:40)
       }
    func setupButtons(){ // sets up up our buttons -- need to add fold
        dealBtn.name = "dealBtn"
        addChild(dealBtn)
        dealBtn.position = CGPoint(x:300, y:40)
        
        nextBtn.name = "nextBtn"
        addChild(nextBtn)
        nextBtn.position = CGPoint(x:100, y:40)
        nextBtn.isHidden = true
        
        resetBtn.name = "resetBtn"
        addChild(resetBtn)
        resetBtn.position = CGPoint(x:600, y:40)
        resetBtn.isHidden = true
        
        beginBtn.name = "beginBtn"
        addChild(beginBtn)
        beginBtn.position = CGPoint(x:100, y:40)
        beginBtn.isHidden = true
             
      
             
        SecondBtn.name = "SecondBtn"
        addChild(SecondBtn)
        SecondBtn.position = CGPoint(x:300, y:40)
        SecondBtn.isHidden = true
        
        ThirdBtn.name = "ThirdBtn"
        addChild(ThirdBtn)
        ThirdBtn.position = CGPoint(x:350, y:40)
        ThirdBtn.isHidden = true
        
        FourBtn.name = "FourBtn"
        addChild(FourBtn)
        FourBtn.position = CGPoint(x:400, y:40)
        FourBtn.isHidden = true
        
        FifthBtn.name = "FifthBtn"
        addChild(FifthBtn)
        FifthBtn.position = CGPoint(x:450, y:40)
        FifthBtn.isHidden = true
        
        SixBtn.name = "SixBtn"
        addChild(SixBtn)
        SixBtn.position = CGPoint(x:500, y:40)
        SixBtn.isHidden = true

        SevenBtn.name = "SevenBtn"
        addChild(SevenBtn)
        SevenBtn.position = CGPoint(x:550, y:40)
        SevenBtn.isHidden = true

        EigthBtn.name = "EigthBtn"
        addChild(EigthBtn)
        EigthBtn.position = CGPoint(x:600, y:40)
        EigthBtn.isHidden = true

        NineBtn.name = "NineBtn"
        addChild(NineBtn)
        NineBtn.position = CGPoint(x:650, y:40)
        NineBtn.isHidden = true

        aceBtn.name = "aceBtn"
        addChild(aceBtn)
        aceBtn.position = CGPoint(x:700, y:40)
        aceBtn.isHidden = true
        
    }
   func bet(betAmount: MoneyValue ){
         // in calling bank we check our balance against the raw value of the user touch
        // SOLVE ISSUE OF if(player1.getCanBet()) {
         // POTENTIAL FIX : create boolean hasGameBegun and nest the below two if statesments inside and nest the first one in
         //getCanBet()
         if(player1.getCanBet() == false  && cardsWereDrawn) { // && gameHasBegun // we can check if game has begun by having a if in deal
             // that checks if player1 + deal hand length == 4 ?? make begin button that is visible once gameHasBegun?
             // if limitCheck
             return
         }
         //else
        if(cardsWereDrawn){
         // if (allIn) then add chip to money container and return
         //else
             dealBtn.isHidden = true;
                     // logic here for when they hit with no money goes here - make them fold
                     // logic below implements a 100 dollar limit per card
             player1.bank.subtractLimit(amount: betAmount.rawValue)
         }
         // checks to see if at 100 limit
         if(player1.bank.limitCheck()){
             return // could replace with a call to hit because that will set canBet to false ??
             // ORR we can leave it the same.. i think it might work the same
             // dont listen to sleepy anty
         }

         if(pot.getMoney() == 0 && player1.bank.getBalance() == 0)
         {
         instructionText.text = "BALANCE RESET- You can pay us back later ;)"
         player1.bank.resetBalance()
         }
    if(player1.bank.getBalance() <= 0 && cardsWereDrawn) {
        return
    }
    

          if(player1.bank.getBalance() <= 0 && !cardsWereDrawn){
         deal()
        }
          else {
         
            let myString = String(player1.bank.getBalance())
               let potString  = String(pot.getMoney())
               moneyText.text = "Current Money: " + myString + "   Current Pot: " + potString
             pot.addMoney(amount: betAmount.rawValue * 2)
             player1.bank.subtractMoney(amount: betAmount.rawValue)
             let tempMoney = Money(moneyValue: betAmount) // local var
             let tempDealerMoney = Money(moneyValue: betAmount)
             tempDealerMoney.anchorPoint = CGPoint(x:0 , y:0 )
             tempMoney.anchorPoint = CGPoint(x:0, y:0)
             // Defines the anchor point of the layer's bounds rectangle. Animatable.
             moneyContainer.addChild(tempMoney)
             // placing 'chips' in money container
             tempMoney.position =
             CGPoint(x:CGFloat(arc4random_uniform(UInt32(moneyContainer.size.width - tempMoney.size.width))), y:CGFloat(arc4random_uniform(UInt32(moneyContainer.size.height - tempMoney.size.height))))
             moneyContainer.addChild(tempDealerMoney)
             tempDealerMoney.position =
                 CGPoint(x:CGFloat(arc4random_uniform(UInt32(moneyContainer.size.width - tempMoney.size.width ))), y:CGFloat(arc4random_uniform(UInt32(moneyContainer.size.height - tempMoney.size.height ))))
             // this position property allows the chip to appear 'randomly' in our money container
             if(!cardsWereDrawn) {
             dealBtn.isHidden = false;
             }
             
          
         }
   //  end of else set Player can bet to false
     }


    func deal() {  // THIS ITERATES LIKE A MOFO EACH CARD ANIMATION IS FULL FUNC CALL OF DEAL
        // like in BJ game deal() will animate the first 2 cards for dealer and player1
        // both cards will be hidden for dealer
        // the cards that are added will be added in stand() or fold()
        
        dealCount -= 1
        moneyText.text = ""
        if(dealCount <= 0) {
            doGameOver()
            return
        }
        if(dealer.hand.getLength() + player1.hand.getLength() < 13) {
            // wait to show buttons until game begins .. once game begins bug handling is pretty good
        instructionText.text = ""
       money25.isHidden = true;
        money50.isHidden = true;
        dealBtn.isHidden = true;
        hitBtn.isHidden = true;
        }
        else {
            // begin game btn
            // rst game btn
            if(!cardsWereDrawn){
            beginBtn.isHidden = false;
            resetBtn.isHidden = false;
        }
            else {}
        }
        var xPos = 0
        //when the game starts we set these sprite nodes to hidden (true/false)
        let tempCard = Card(suit: "card_front", value: 0)
        let newCard = deck.getTopCard()
        // whichHand and whichPosition are used for player1/dealer we add new cards to either dealer/player1/communityhand
        var whichPosition = playerCardsY
        var whichHand = player1.hand
        if(self.currentPlayerType is Player){
            whichHand = player1.hand
            whichPosition = playerCardsY;
        }
        else {
        //certain scenarios will change currentPlayerType to dealer
        whichHand = dealer.hand
        whichPosition = dealerCardsY;
              }
              
   
        whichHand.addCard(card: newCard)
        if(self.currentPlayerType is Player){
          xPos = 50 + (whichHand.getLength() * (35))
       if(communityHand.getLength() > 0)  {
    
        xPos = 50 + (whichHand.getLength() * (30))
        
            }
     
        }
        else{
            xPos = 50}
// this is the card in animation!! not dealer hidden card
        
        tempCard.position = CGPoint(x:630, y:980) //9
        addChild(tempCard) // appends temp card to table
        tempCard.zPosition = 100
        //We need this card drawn at a zPosition greater than 0, because the dealer's first card needs to be at 0
        
        let moveCard = SKAction.move(to: CGPoint(x:xPos, y: whichPosition),duration: 0.3)
        //moveCard will move the node from one position to another
        tempCard.run(moveCard, completion: { [unowned self] in
            self.player1.setCanBet(canBet: true) // allows the player to bet prior to this                                      //call canBet is false
            //checks to see that the dealer only has one card
            // hide two cards for hold em and then we can append with cards with real values using this func
            // change so getLength() == 2

            if(self.currentPlayerType is Dealer) {
                self.allCards.append(tempCard)
                tempCard.removeFromParent()
                self.addChild(tempCard)
                self.dealerCard.zPosition = 100
                self.dealerCard.position = CGPoint( x: xPos, y: whichPosition) //The xPos constant determines the final x position of the card once it is finished animating

            } else{
            self.allCards.append(newCard)
            tempCard.removeFromParent()
            self.addChild(newCard)
            newCard.position = CGPoint( x: xPos, y: whichPosition) //The xPos constant determines the final x position of the card once it is finished animating
            newCard.zPosition = 100
            }
            //animation logic very directly transferable
        if(self.dealer.hand.getLength() == 7){
            self.cardsWereDrawn = true// this determines how many cards get animated and given a value for the dealer or player 1 -- one of these cards is hidden for the dealer
            }
            if(!self.cardsWereDrawn){
            if(self.currentPlayerType is Player){
                self.currentPlayerType = self.dealer
                
            }else{
                self.currentPlayerType = self.player1
                
                
            }
                
              self.deal()
                // dynamic button set up -- this will be called by nextBtn as well
            }

                 
        })
    }
    
    
    
    func doGameOver(){
        nextBtn.isHidden = true
        var winner:GenericPlayer = player1
             // this logic will be replaced by selection statements that use .getValue() either from hand or eval()
             
        if (player1.hand.getFourCount() > dealer.hand.getFourCount()){
            instructionText.text = "You Win!"
            
            winner = player1

        }else if (player1.hand.getFourCount() < dealer.hand.getFourCount()){
            instructionText.text = "Dealer Wins!"
            winner = dealer
        }
        else {
            instructionText.text = "You tied!"
        }
        if(winner is Player){
            player1.bank.addMoney(amount: pot.getMoney())

            moveMoneyContainer(position: playerCardsY)
        }else{
            moveMoneyContainer(position: dealerCardsY)
            
        }

    }
    //moves the moneyContainer to whoever won the game, player or the dealer. When the SKAction completes, we invoke resetMoneyContainer.
    func moveMoneyContainer(position: Int){
        let moveMoneyContainer = SKAction.moveTo(y: CGFloat(position), duration: 3.0)
        moneyContainer.run(moveMoneyContainer, completion: { [unowned self] in
                self.resetMoneyContainer()
        });
    }
    func resetMoneyContainer(){
        moneyContainer.removeAllChildren()
        moneyContainer.position.y = size.height/1.6
        newGame()
    }
    func newGame(){
    currentPlayerType = player1
    communityCardsStarted = false
    deck.new()
    userFourText.text = "0"
    deckText.text = "0"
    dealerHandText.text = "0"
    dealerFoursText.text = "0"
        pot.reset()
    let myString = String(player1.bank.getBalance())
    let potString  = String(pot.getMoney())
    moneyText.text = "Current Money " + myString + "Current Pot" + potString
    instructionText.text = "PLACE YOUR BET";
    if(player1.bank.getBalance() == 0){
    instructionText.text = "Start betting to reset your balance"
    }
    instructionText.text = "Press deal to begin";
  
    dealBtn.isHidden = false
        nextBtn.isHidden = true;
        resetBtn.isHidden = true;
        beginBtn.isHidden = true;
        money10.isHidden = false;
        money25.isHidden = false;
        money50.isHidden = false
        player1.hand.resetFourCount()
        dealer.hand.resetFourCount()
        cardsWereDrawn = false
        dealCount = 36
    player1.hand.reset()
    dealer.hand.reset()
    communityHand.reset()
    player1.setYielding(yields: false)
         
    for card in allCards{
        card.removeFromParent()
    }
    allCards.removeAll()
    }
    func begin() {
        dealBtn.isHidden = true;
        beginBtn.isHidden = true;
        resetBtn.isHidden = true;
        hitBtn.isHidden = false;
        money25.isHidden = false;
        money50.isHidden = false;
        createButtons()
        let four = String(player1.hand.getFourCount())
        let dealerFour = String(dealer.hand.getFourCount())
        let dealerCount = String(dealer.hand.getFullDeck().count)
        let stringDeck = String(dealCount)
           userFourText.text = four
           deckText.text = stringDeck
           dealerHandText.text = dealerCount
           dealerFoursText.text = dealerFour
       
    }

    func reset() {
        currentPlayerType = player1
        communityCardsStarted = false
        deck.new()
        for card in allCards{
               card.removeFromParent()
           }
           allCards.removeAll()
           player1.hand.reset()
           dealer.hand.reset()
           communityHand.reset()
        cardsWereDrawn = false
        dealCount = 36
        deal()
        }
        
    
    
   
    func isButtonValid(numValue: Int)->Bool{
         // dynamic button set up
        var a = 0
        for card in player1.hand.getFullDeck() {
            if(card.getValue() == numValue ){
            a = 1
            }
            else {}
        }
        if(a == 1 ) {return true}
        else {return false}
    }
    func createButtons() {
        if(isButtonValid(numValue: 1)){
            aceBtn.isHidden = false
        }
        if(isButtonValid(numValue: 2)){
            SecondBtn.isHidden = false
        }
        if(isButtonValid(numValue: 3)){
            ThirdBtn.isHidden = false
        }
        if(isButtonValid(numValue: 4)){
            FourBtn.isHidden = false
        }
        if(isButtonValid(numValue: 5)){
            FifthBtn.isHidden = false
        }
        if(isButtonValid(numValue: 6)){
            SixBtn.isHidden = false
        }
        if(isButtonValid(numValue: 7)){
            SevenBtn.isHidden = false
        }
        if(isButtonValid(numValue: 8)){
            EigthBtn.isHidden = false
        }
        if(isButtonValid(numValue: 9)){
            NineBtn.isHidden = false
        }
    }
    func resetButtons() {
        aceBtn.isHidden = true
        SecondBtn.isHidden = true
        ThirdBtn.isHidden = true
        FourBtn.isHidden = true
        FifthBtn.isHidden = true
        SixBtn.isHidden = true
        SevenBtn.isHidden = true
        EigthBtn.isHidden = true
        NineBtn.isHidden = true
        
    }
    func checkForFish(cardValue: Int, primaryHand: Hand, secondaryHand: Hand ){
        if(player1.hand === primaryHand) {
            nextBtn.isHidden = false
        }
       // make player types dynamic primary type and secondary type
        for card in secondaryHand.getFullDeck() {
            if(secondaryHand.getInputCard(c: card) == cardValue) {
            let newCard = Card(suit: secondaryHand.getInputSuite(c: card), value: secondaryHand.getInputCard(c: card))
            primaryHand.addCard(card: newCard)
            card.removeFromParent()
            var xPos = 0
            var whichPosition = 0
                if(primaryHand === player1.hand){
                    successfulOnce = true
                    communityHand.addCard(card: newCard)
                    xPos = 25 + (communityHand.getLength() * 55)
                    whichPosition = playerCardsY + 200

                }
                else {
                    xPos = 50 + (dealer.hand.getLength()*5)
                    whichPosition = dealerCardsY
                    }
                 let tempCard = Card(suit: "card_front", value: 0)
                if(primaryHand === player1.hand) {
                    tempCard.position = CGPoint(x:dealerCard.position.x, y:dealerCard.position.y)
                }
                else{
                    tempCard.position = CGPoint(x:secondaryHand.getCard(card: card).position.x , y:secondaryHand.getCard(card: card).position.y) } //9
                addChild(tempCard) // appends temp card to table
                tempCard.zPosition = 100
                secondaryHand.subtractHand(c: secondaryHand.getIndex(c: card))
               
                
                
                 //We need this card drawn at a zPosition greater than 0, because the dealer's first card needs to be at 0
                 
                 let moveCard = SKAction.move(to: CGPoint(x:xPos, y: whichPosition),duration: 1.0)
                 //moveCard will move the node from one position to another.
                 tempCard.run(moveCard, completion: { [unowned self] in
                      // allows the player to bet prior to this                                      //call canBet is false
                     //checks to see that the dealer only has one card
                     // hide two cards for hold em and then we can append with cards with real values using this func
                     // change so getLength() == 2
                  //   if(self.currentPlayerType is Player) {
                     self.allCards.append(tempCard)
                     tempCard.zPosition = 0
                 
                     tempCard.removeFromParent()
                     self.allCards.append(newCard)
                    if(primaryHand === self.player1.hand) {
                      self.addChild(newCard)
                    }
                    else {
                        self.allCards.append(tempCard)
                        self.addChild(tempCard)
                    }
                     newCard.position = CGPoint( x: xPos, y: whichPosition) //The xPos constant determines the final x position of the card once it is finished animating
                     newCard.zPosition = 95
                    
                //     }
                })
                    noMatches = false
                }
        }
        if(!noMatches){
             noMatches = true
            
        }
        else {
           if(primaryHand === player1.hand){
               currentPlayerType = player1
               deal()
               nextBtn.isHidden =  false
               resetButtons()
           }
               else {
                   currentPlayerType = dealer
                   deal()
               }
        }
            
        }
    
    func nextTurn() {
          // nextTurn button - > will check if dealer is going to check for fish -- also will check if anyone has zero cards and if deck is empty
        if(dealCount <= 0){
            doGameOver()
            return
        }
        nextBtn.isHidden = true
    
        if(dealer.hand.getLength() == 0){
           doGameOver()
        return
        }
        if(player1.hand.getLength() == 0){
                doGameOver()
                return
        }
        var dealersCurrentHand = dealer.hand.getFullDeck()
        dealersCurrentHand.shuffle()
        let firstFish = dealersCurrentHand[0]
        
       
            checkForFish(cardValue: firstFish.getValue(), primaryHand: dealer.hand, secondaryHand: player1.hand)

        
        // generate random number 1-3
      //  checkForFish(cardValue: firstFish.getValue(), primaryHand: dealer.hand, secondaryHand: player1.hand )
        checkFours(handCheck: player1.hand)
        checkFours(handCheck: dealer.hand)
        let four = String(player1.hand.getFourCount())
        let dealerFour = String(dealer.hand.getFourCount())
        let dealerCount = String(dealer.hand.getFullDeck().count)
        let stringDeck = String(dealCount)
        userFourText.text = four
        deckText.text = stringDeck
        dealerHandText.text = dealerCount
        dealerFoursText.text = dealerFour
        resetButtons()
        createButtons()
    }
            
        
    func checkFours(handCheck: Hand) {
      // logic that checks for four instances of player/dealer hand
            for n in 1...9 {
                for card in handCheck.getFullDeck(){
                    if(handCheck.checkFour(check: n, card: card)){
                        // code that executes when 4 of a kind are found
                        handCheck.addTofourCount(i: n)
                        for cardyB in allCards {
                            if(cardyB.getValue() == n){
                                // removes the cards with the same
                                // value from the player/dealer animated hand
                            cardyB.removeFromParent()
                            }
                        }
                        handCheck.filter(n: n)
                        // filters out the value from the hand so it doesnt add to four count more than once
                        communityHand.filter(n: n)
                        }
                        
                    }
                // reset the instance -> by the time the code reaches here it has either added to four count or does not have four .. either way reset
                    handCheck.resetInstances()

                }
            }
        
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
                 
        let touchLocation = touch.location(in: self)
        let touchedNode = self.atPoint(touchLocation)
                 // if (touchedNode.name = checkFish1) {
        
        if(touchedNode.name == "money"){
            let money = touchedNode as! Money
            bet(betAmount: money.getValue())
            let myString = String(player1.bank.getBalance())
            let potString  = String(pot.getMoney())
            moneyText.text = "Current Money " + myString + "Current Pot" + potString // updates the money and pot amount after
                                                                                    // a chip is adde
        }
       
        if(touchedNode.name == "dealBtn"){
            // does not allow user to deal with zero pot
            deal()

        }
        if(touchedNode.name == "aceBtn"){
                  checkForFish(cardValue: 1, primaryHand: player1.hand, secondaryHand: dealer.hand)
                aceBtn.isHidden = true

        }
        if(touchedNode.name == "SecondBtn"){
                  checkForFish(cardValue: 2, primaryHand: player1.hand, secondaryHand: dealer.hand)
            SecondBtn.isHidden = true

              }
        if(touchedNode.name == "ThirdBtn"){
                  checkForFish(cardValue: 3, primaryHand: player1.hand, secondaryHand: dealer.hand)
        ThirdBtn.isHidden = true

              }
        if(touchedNode.name == "FourBtn"){
                  checkForFish(cardValue: 4, primaryHand: player1.hand, secondaryHand: dealer.hand)
                FourBtn.isHidden = true

              }
        if(touchedNode.name == "FifthBtn"){
                  checkForFish(cardValue: 5, primaryHand: player1.hand, secondaryHand: dealer.hand)
                FifthBtn.isHidden = true

              }
        if(touchedNode.name == "SixBtn"){
            checkForFish(cardValue: 6, primaryHand: player1.hand, secondaryHand: dealer.hand)
            SixBtn.isHidden = true

        }
        if(touchedNode.name == "SevenBtn"){
            checkForFish(cardValue: 7, primaryHand: player1.hand, secondaryHand: dealer.hand)
            SevenBtn.isHidden = true
        }
        
        if(touchedNode.name == "EigthBtn"){
            checkForFish(cardValue: 8, primaryHand: player1.hand, secondaryHand: dealer.hand)
            EigthBtn.isHidden = true
              }
        if(touchedNode.name == "NineBtn"){
        checkForFish(cardValue: 9, primaryHand: player1.hand, secondaryHand: dealer.hand)
            NineBtn.isHidden = true
          }
        if(touchedNode.name == "beginBtn") {
        begin()
        }
        if(touchedNode.name == "nextBtn") {
            nextTurn()
        }
        if(touchedNode.name == "resetBtn") {
            reset()
        }
  
}
}
