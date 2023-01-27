//
//  BlackJackViewController.swift
//  Play BlackJack
//
//  Created by Damian S on 2023-01-11.
//

import UIKit



class BlackJackViewController: UIViewController {


    @IBOutlet var DealButton: UIButton!
    @IBOutlet var HitButton: UIButton!
    @IBOutlet var StandButton: UIButton!
    @IBOutlet var RestartButton: UIButton!
    @IBOutlet var PlayerCard: UIImageView!
    @IBOutlet var DealerCard: UIImageView!
    @IBOutlet var TotalCount: UILabel!
    @IBOutlet var WinningLabel: UILabel!
    @IBOutlet var FundsLabel: UILabel!
    @IBOutlet var BetAmountLabel: UILabel!
    @IBOutlet var WinningAmountLabel: UILabel!
    @IBOutlet var BetAmount: UITextField!
    var dealtCards: [singleCard] = []
    var dealtCardViews: [UIImageView] = []
    var dealtDealerCards: [singleCard] = []
    var dealtDealerCardViews: [UIImageView] = []
    let screenWidth = UIScreen.main.bounds.width
    
    var playerImageViews: [UIImageView] = []
    var cards = card.allCards
    
    var myMoney: Double = 100
    var bet: Double = 10
    
    let defaults = UserDefaults.standard
    //Set
    
    //Get
    

    override func viewDidLoad() {
        super.viewDidLoad()
        HitButton.isHidden = true
        StandButton.isHidden = true
        RestartButton.isHidden = true
        DealButton.layer.cornerRadius = 8
        HitButton.layer.cornerRadius = 8
        StandButton.layer.cornerRadius = 8
        RestartButton.layer.cornerRadius = 8
//        DealButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        view.addSubview(DealButton)
        // Set up the image views
        PlayerCard.frame.origin.x = screenWidth
        view.addSubview(PlayerCard)
        DealerCard.frame.origin.x = screenWidth
        view.addSubview(DealerCard)
        myMoney = self.defaults.double(forKey: "Money")
        if myMoney == 0 {
            self.defaults.set(100.0, forKey: "Money")
            myMoney = 100
        }
        FundsLabel.text = "Funds: \(myMoney)"
    }
    
    @IBAction func DealButtonTapped(_ sender: UIButton) {
        self.bet = Double(BetAmount.text ?? "10") ?? 10.0
        if bet == 0.0 {
            self.bet = 10.0
        }
        if self.bet > myMoney {
            self.bet = myMoney
        }
        updateFunds(amount: self.bet * -1.0)
        BetAmount.isHidden = true
        BetAmountLabel.isHidden = true
        var randomCard = generateRandomCard()
        dealtCards.append(randomCard)
        
        let newCard = UIImageView(image: randomCard.image)
        newCard.frame = PlayerCard.frame
        newCard.frame.origin.x = screenWidth
        dealtCardViews.append(newCard)
        newCard.contentMode = .scaleAspectFit
        
        randomCard = generateRandomCard()
        dealtCards.append(randomCard)
        let newCard2 = UIImageView(image: randomCard.image)
        newCard2.frame = PlayerCard.frame
        newCard2.frame.origin.x = screenWidth
        dealtCardViews.append(newCard2)
        newCard2.contentMode = .scaleAspectFit
        
        randomCard = generateRandomCard()
        dealtDealerCards.append(randomCard)
        
        let newDealerCard = UIImageView(image: randomCard.image)
        let temp = UIImageView(frame: DealerCard.frame)
        temp.contentMode = .scaleAspectFit
        temp.image = UIImage(named: "back")
        newDealerCard.frame = DealerCard.frame
        newDealerCard.frame.origin.x = screenWidth
        dealtDealerCardViews.append(temp)
        newDealerCard.contentMode = .scaleAspectFit
        
        randomCard = generateRandomCard()
        dealtDealerCards.append(randomCard)
        let newDealerCard2 = UIImageView(image: randomCard.image)
        newDealerCard2.frame = DealerCard.frame
        newDealerCard2.frame.origin.x = screenWidth
        dealtDealerCardViews.append(newDealerCard2)
        newDealerCard2.contentMode = .scaleAspectFit
        
        UIView.animate(withDuration: 0.5, animations: {
            newCard.center.x = self.screenWidth/2 - 43
            newCard2.center.x = self.screenWidth/2 + 43
            temp.center.x = self.screenWidth/2 - 43
            newDealerCard2.center.x = self.screenWidth/2 + 43
            self.view.addSubview(newCard)
            self.view.addSubview(newCard2)
            self.view.addSubview(temp)
            self.view.addSubview(newDealerCard2)
        }, completion: { _ in
            self.TotalCount.text = "Total = \(self.convertValue(cards: self.dealtCards))"
            if self.convertValue(cards: self.dealtCards) == 21 {
                self.endGame()
                self.playDealer {
                    if self.convertValue(cards: self.dealtDealerCards) == 21 {
                        self.WinningLabel.text = "TIE"
                        self.updateFunds(amount: self.bet)
                    } else {
                        self.WinningLabel.text = "YOU WIN"
                        self.updateFunds(amount: self.bet*2.5)
                        self.displayWinnings(amount: self.bet*1.5)
                    }
                }
                
            }
        })
        self.HitButton.isHidden = false
        self.StandButton.isHidden = false
        self.DealButton.isHidden = true
        
    }

    @IBAction func HitButtonTapped(_ sender: UIButton) {
        let randomCard = generateRandomCard()
        dealtCards.append(randomCard)
        
        let newCard = UIImageView(image: randomCard.image)
        newCard.frame = PlayerCard.frame
        newCard.frame.origin.x = screenWidth
        dealtCardViews.append(newCard)
        let middleOfScreen = self.screenWidth/2
        let numCards = dealtCardViews.count
        var count = numCards/2 - 1
        newCard.contentMode = .scaleAspectFit
        print(middleOfScreen)
        // must offset all by 33 (half of width) otherwise would have to use .center
        //
        UIView.animate(withDuration: 0.5, animations: {
            if numCards % 2 == 1 {
                self.dealtCardViews[numCards/2].frame = CGRect(x: middleOfScreen - 33, y: self.PlayerCard.frame.origin.y, width: self.PlayerCard.frame.width, height: self.PlayerCard.frame.height)
                for i in 1...Int(numCards/2) {
                    self.dealtCardViews[numCards/2 + i].frame = CGRect(x: middleOfScreen + CGFloat(16*i) - 33, y: self.PlayerCard.frame.origin.y, width: self.PlayerCard.frame.width, height: self.PlayerCard.frame.height)
                    self.dealtCardViews[numCards/2 - i].frame = CGRect(x: middleOfScreen - CGFloat(16*i) - 33, y: self.PlayerCard.frame.origin.y, width: self.PlayerCard.frame.width, height: self.PlayerCard.frame.height)
                }
            } else {
                for i in 0..<(numCards/2){
                    self.dealtCardViews[i].frame = CGRect(x: middleOfScreen - 41 - CGFloat(16*count), y: self.PlayerCard.frame.origin.y, width: self.PlayerCard.frame.width, height: self.PlayerCard.frame.height)
                    count -= 1
                    print(self.dealtCardViews[i].frame.origin.x)
                }
                for i in (numCards/2)..<numCards{
                    self.dealtCardViews[i].frame = CGRect(x: middleOfScreen - 25 + CGFloat(16*(i-(numCards/2))), y: self.PlayerCard.frame.origin.y, width: self.PlayerCard.frame.width, height: self.PlayerCard.frame.height)
                    print(self.dealtCardViews[i].frame.origin.x)
                }
                
            }
            self.view.addSubview(newCard)
        }, completion: {_ in
            let value = self.convertValue(cards: self.dealtCards)
            if value > 21 {
                self.TotalCount.text = "BUST"
                self.dealerShowCard{}
                self.endGame()
                self.RestartButton.isHidden = false
                self.displayWinnings(amount: self.bet*(-1.0))
            } else if value == 21 {
                self.TotalCount.text = "21"
                self.endGame()
                self.playDealer {
                    self.RestartButton.isHidden = false
                    if self.convertValue(cards: self.dealtDealerCards) == 21 {
                        self.WinningLabel.text = "TIE"
                        self.updateFunds(amount: self.bet)
                    } else {
                        self.WinningLabel.text = "YOU WIN"
                        self.updateFunds(amount: self.bet*2.5)
                        self.displayWinnings(amount: self.bet*1.5)
                    }
                }
                
            }
            
            else {
                self.TotalCount.text = "Total = \(self.convertValue(cards: self.dealtCards))"
            }
        })
        
        
        
        
    }
    
    func convertValue(cards: [singleCard]) -> Int {
        var count = 0
        var numOfAs = 0
        for card in cards{
            let faceValue: String = card.faceValue
            if let number = Int(faceValue) {
                count += number
            } else {
                if faceValue == "A" {
                    count += 11
                    numOfAs += 1
                } else {
                    count += 10
                }
            }
        }
        
        while count > 21 && numOfAs > 0 {
            numOfAs -= 1
            count -= 10
        }
        return count
    }
    
    
    @IBAction func RestartButtonTapped(_ sender: UIButton) {
        BetAmount.isHidden = false
        BetAmountLabel.isHidden = false
        DealButton.isHidden = false
        HitButton.isHidden = true
        StandButton.isHidden = true
        RestartButton.isHidden = true
        HitButton.isEnabled = true
        StandButton.isEnabled = true
        WinningAmountLabel.text = nil
        dealtCards = []
        dealtDealerCards = []
        WinningLabel.text = nil
        TotalCount.text = nil
        for subview in dealtCardViews {
            subview.removeFromSuperview()
        }
        for subview in dealtDealerCardViews {
            subview.removeFromSuperview()
        }
        
        dealtCardViews = []
        dealtDealerCardViews = []
        print(dealtCards)
        
    }
    
    @IBAction func StandButtonTapped(_ sender: UIButton) {
        self.endGame()
        playDealer {
            self.RestartButton.isHidden = false
            let dealerCount = self.convertValue(cards: self.dealtDealerCards)
            let playerCount = self.convertValue(cards: self.dealtCards)
            if dealerCount > 21 {
                self.WinningLabel.text = "DEALER BUSTS"
                self.updateFunds(amount: self.bet*2.0)
                self.displayWinnings(amount: self.bet)
            } else if dealerCount > playerCount {
                self.WinningLabel.text = "DEALER WINS"
                self.displayWinnings(amount: self.bet*(-1.0))
            } else if dealerCount == playerCount {
                self.WinningLabel.text = "TIE"
                self.updateFunds(amount: self.bet)
            } else {
                self.WinningLabel.text = "YOU WIN"
                self.updateFunds(amount: self.bet*2.0)
                self.displayWinnings(amount: self.bet)
            }

        }
        
    }
    
    func playDealer(completion: @escaping () -> Void) {
        dealerShowCard{
            // have another imageview for the back of the card, not in dealt card views
            // flip from that to the dealt card views
            if self.convertValue(cards: self.dealtDealerCards) > 16 {
                completion()
            }
            while(self.convertValue(cards: self.dealtDealerCards) < 17){
                let randomCard = self.generateRandomCard()
                self.dealtDealerCards.append(randomCard)
                
                let newCard = UIImageView(image: randomCard.image)
                newCard.frame = self.DealerCard.frame
                newCard.frame.origin.x = self.screenWidth
                self.dealtDealerCardViews.append(newCard)
                let middleOfScreen = self.screenWidth/2
                let numCards = self.dealtDealerCardViews.count
                var count = numCards/2 - 1
                newCard.contentMode = .scaleAspectFit
                // must offset all by 33 (half of width) otherwise would have to use .center
                //
                UIView.animate(withDuration: 0.5, animations: {
                    if numCards % 2 == 1 {
                        print(self.dealtDealerCardViews[0].frame)
                        self.dealtDealerCardViews[numCards/2].frame = CGRect(x: middleOfScreen - 33, y: self.DealerCard.frame.origin.y, width: self.DealerCard.frame.width, height: self.DealerCard.frame.height)
                        for i in 1...Int(numCards/2) {
                            self.dealtDealerCardViews[numCards/2 + i].frame = CGRect(x: middleOfScreen + CGFloat(16*i) - 33, y: self.DealerCard.frame.origin.y, width: self.DealerCard.frame.width, height: self.DealerCard.frame.height)
                            self.dealtDealerCardViews[numCards/2 - i].frame = CGRect(x: middleOfScreen - CGFloat(16*i) - 33, y: self.DealerCard.frame.origin.y, width: self.DealerCard.frame.width, height: self.DealerCard.frame.height)
                        }
                    } else {
                        for i in 0..<(numCards/2){
                            self.dealtDealerCardViews[i].frame = CGRect(x: middleOfScreen - 41 - CGFloat(16*count), y: self.DealerCard.frame.origin.y, width: self.DealerCard.frame.width, height: self.DealerCard.frame.height)
                            count -= 1
                            print(self.dealtCardViews[i].frame.origin.x)
                        }
                        for i in (numCards/2)..<numCards{
                            self.dealtDealerCardViews[i].frame = CGRect(x: middleOfScreen - 25 + CGFloat(16*(i-(numCards/2))), y: self.DealerCard.frame.origin.y, width: self.DealerCard.frame.width, height: self.DealerCard.frame.height)
                            print(self.dealtDealerCardViews[i].frame.origin.x)
                        }
                        
                    }
                    self.view.addSubview(newCard)
                }, completion: { _ in completion()})
            }
        }
    }
    
    func dealerHit() {
        
        
    }
    
    func endGame() {
        HitButton.isEnabled = false
        StandButton.isEnabled = false
    }
    
    func dealerShowCard(completion: @escaping () -> Void) {
        let transitionOptions: UIView.AnimationOptions = [.transitionFlipFromRight, .showHideTransitionViews]
                
        UIView.transition(with: dealtDealerCardViews[0], duration: 1.0, options: transitionOptions, animations: {
            self.dealtDealerCardViews[0].image = self.dealtDealerCards[0].image
        }, completion: {_ in completion()})
    }
    
    func generateRandomCard() -> singleCard {
        if cards.count == 0{
            cards = card.allCards
        }
        let random = Int.random(in: 0..<cards.count)
        let randomCard = cards[random]
        cards.remove(at: random)
        return randomCard
    }
    
    func updateFunds (amount: Double) {
        self.myMoney += amount
        FundsLabel.text = "Funds: $\(self.myMoney)"
    }
    
    func displayWinnings (amount: Double) {
        let sign = amount > 0 ? "+" : "-"
        self.WinningAmountLabel.text = sign + String(abs(amount))
        self.WinningAmountLabel.textColor = amount > 0 ? .systemGreen : .systemRed
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
            self.WinningAmountLabel.text = nil
        }
    }
}
