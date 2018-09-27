import Foundation
protocol ObjectsToPrint {
    func p()
}
class CommonInfo {
    var id: Int
    var balance: Double
    var currency: Int
    init(id: Int, balance: Double, currency: String) {
        self.id = id
        self.balance = balance
        switch currency {
        case "RUR":
            self.currency = 0
        case "USD":
            self.currency = 1
        case "EUR":
            self.currency = 2
        default:
            self.currency = -1
        }
    }
}

class Account: CommonInfo, ObjectsToPrint {
    var description: String
    var offer: String?
    init(id: Int, balance: Double, currency: String, description: String, offer: String? = nil) {
        self.description = description
        self.offer = offer
        super.init(id: id, balance: balance, currency: currency)
    }
    
    func p(){
        print("-------- Account Info --------")
        print("id: \(id)")
        print("Balance: \(balance)")
        switch currency {
        case 0:
            print("Currency: RUR")
        case 1:
            print("Currency: USD")
        case 2:
            print("Currency: EUR")
        default:
            print("Currency: Undefined")
        }
        print("Description: \(description)")
        if let text = offer {
            print("Offer: \(text)")
        } else {
            print("Offer: Not found")
        }
    }
}


class ReissueInfo: ObjectsToPrint {
    var date: Date?
    var info: String
    var address: String
    init(date_s: String, info: String, address: String = "Головной офис"){
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd MMMM yyyy"
        date = dateFormater.date(from: date_s)
        self.info = info
        self.address = address
    }
    
    func p(){
        print("-------- Reissue Info --------")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd --- MM --- yyyy"
        let d = dateFormatter.string(from: date!)
        
        print("Date: \(d)")
        print("Info: \(info)")
        print("Address: \(address)")
    }
}

class Card: CommonInfo, ObjectsToPrint {
    var reissueInfo: ReissueInfo?
    init(id: Int, balance: Double, currency: String, reissueInfo: ReissueInfo? = nil) {
        self.reissueInfo = reissueInfo
        super.init(id: id, balance: balance, currency: currency)
    }
    
    func p(){
        print("--------- Card Info ----------")
        print("id: \(id)")
        print("Balance: \(balance)")
        switch currency {
        case 0:
            print("Currency: RUR")
        case 1:
            print("Currency: USD")
        case 2:
            print("Currency: EUR")
        default:
            print("Currency: Undefined")
        }
        if let obj = reissueInfo {
            print("ReissueInfo: ")
            obj.p()
        } else {
            print("ReissueInfo: Not found")
        }
    }
}
class ServerResponce: ObjectsToPrint {
    var cards: [Card]
    var accounts: [Account]
    init(cards: [Card], accounts: [Account]) {
        self.cards = cards
        self.accounts = accounts
    }
    
    func p(){
        print("----- ServerResponce Info ---- \n")
        print("Cards Count: \(cards.count)")
        print("Accounts Count: \(accounts.count)")
        print("Full Info below \n")
        if cards.count != 0 {
            for c in cards {
                c.p()
            }
            print()
        }
        if accounts.count != 0 {
            for a in accounts {
                a.p()
            }
        }
    }
}

let ac1 = Account(id: 1, balance: 1000000.25, currency: "USR", description: "Panda")
let ac2 = Account(id: 2, balance: 0.5, currency: "EUR", description: "Kotik", offer: "Can pomyaukat' za lyam")
let accs = [ac1, ac2]
/*for t in accs {
    t.p()
} */
let reissueInfo = ReissueInfo(date_s: "27 сентября 2018", info: "Card poteryalasya))")
// reissueInfo.p()

let card1 = Card(id: 1015, balance: 100, currency: "EUR", reissueInfo: reissueInfo)
let card2 = Card(id: 2037, balance: 23752.78, currency: "RUR")
let cards = [card1, card2]
/* for i in cards {
    i.p()
} */
let response = ServerResponce(cards: cards, accounts: accs)
// response.p()
var array = [ObjectsToPrint]()
array.append(contentsOf: cards)
array.append(contentsOf: accs)
array.append(response)
for o in array {
    o.p()
    print()
}
print()
