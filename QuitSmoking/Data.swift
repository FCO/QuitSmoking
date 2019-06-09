import Foundation

struct Data {
    var extra       : Int = 4
    var smokedToday : Int = 0
    var smokedTotal : Int = 0
    var spent       : Int = 0
    var next        : Date?
    var interval    = TimeInterval(15 * 60)
    var punishment  = 0.2
    
    mutating func smokeExtra() {
        extra -= 1
        smoke()
    }
    
    mutating func smoke() {
        smokedToday += 1
        smokedTotal += 1
        next = Date().addingTimeInterval(interval)
    }
    
    mutating func canSmoke() -> Bool {
        let now = Date()
        guard let next = next else {
            return true
        }
        if now > next {
            return true
        }
        
        let more = now.timeIntervalSince(next)
        self.next = next.addingTimeInterval(punishment * (interval - more))
        return false
    }
}
