import Foundation

class Hand {
   private var hand = [Card]()
    var instancesOfFour = 0
    var valueInstances = 0
    func addCard(card: Card){
        // have to append 2 cards to dealer and player1. then append additionaly 5 during the game
        hand.append(card)
        
    }
    
    // this func is looped thru for every value (check) and for every card(card)
    // ex. a value of 2 which is looped thru for every card in the players hand
    func checkFour(check: Int, card: Card)->Bool {
       
        
            if (card.getValue() == check) {
                valueInstances += 1
            }
        
        
        if(valueInstances == 4) {
            valueInstances = 0
            return true
        }
        else {
            
            return false
        }
    }
    func resetInstances() {
        valueInstances = 0
    }
  
    func reset(){
        hand.removeAll()
    }
    
    func filter(n: Int) {
// filters out the 4 of a kind
        hand = hand.filter { $0.getValue() != n}

    }
    func getFullCard(a: Int)->Card {
      return  hand[a]
    }
    func getFullDeck()->[Card]{
        return hand
    }
    func getInputCard(c: Card)->Int{
       return  c.getValue()
    }
    func getInputSuite(c: Card)->String {
        return c.getSuite()
    }
    func getIndex(c: Card)->Int {
        return getFullDeck().lastIndex(of: c)!
    
    }
    func subtractHand(c: Int) {
        hand.remove(at: c)
    }


func getLength()-> Int{
        return hand.count
    }
    func addTofourCount(i: Int) {
        instancesOfFour += 1
    }
    func getFourCount()->Int {
        return instancesOfFour
    }
    func resetFourCount() {
        instancesOfFour = 0
    }
    func getCard(card: Card)->Card{
        return card
    }
   
}

