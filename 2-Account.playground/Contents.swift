import UIKit

let json = """
 [
   {
     "id": "1",
     "type": "Investment",
     "name": "Basic Savings",
     "amount": 32552.19,
     "createdDateTime" : "2018-06-05T23:45:59Z"
   },
   {
     "id": "2",
     "type": "CreditCard",
     "name": "No-Fee All-In Chequing",
     "amount": 5320.44,
     "createdDateTime" : "2016-07-15T21:17:22Z"
   },
  ]
"""

enum AccountType: String, Codable {
    case Banking
    case CreditCard
    case Investment
}


struct Account: Codable {
    // 🕹 Game on here
    let id: String
    let type: AccountType
    let name: String
    let amount: Decimal
    let createdDateTime: Date
}

let jsonData = json.data(using: .utf8)!
let decoder = JSONDecoder()
decoder.dateDecodingStrategy = .iso8601
let result = try! decoder.decode([Account].self, from: jsonData)

print(result)
