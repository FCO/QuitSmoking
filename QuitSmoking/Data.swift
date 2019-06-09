import Foundation

struct Data {
    var defaults    = UserDefaults.standard
    var extra       : Int = 4
    var smokedToday : Int = 0
    var smokedTotal : Int = 0
    var spent       : Int = 0
    var next        : Date?
    var interval    = TimeInterval(15 * 60)
    var punishment  = 0.2
    
    init() {
        load()
    }
    
    func save() {
        defaults.set(extra,         forKey: "extra"         )
        defaults.set(smokedToday,   forKey: "smokedToday"   )
        defaults.set(smokedTotal,   forKey: "smokedTotal"   )
        defaults.set(spent,         forKey: "spent"         )
        defaults.set(next,          forKey: "next"          )
        defaults.set(interval,      forKey: "inerval"       )
        defaults.set(punishment,    forKey: "punishment"    )
    }

    mutating func load() {
        if let extra = defaults.object(forKey: "extra") {
            self.extra = extra as! Int
        }
        if let smokedTotal = defaults.object(forKey: "smokedTotal") {
            self.smokedTotal = smokedTotal as! Int
        }
        if let smokedToday = defaults.object(forKey: "smokedToday") {
            self.smokedToday = smokedToday as! Int
        }
        if let spent = defaults.object(forKey: "spent") {
            self.extra = spent as! Int
        }
        if let next = defaults.object(forKey: "next") {
            self.next = next as? Date
        }
        if let interval = defaults.object(forKey: "interval") {
            self.interval = interval as! TimeInterval
        }
        if let punishment = defaults.object(forKey: "punishment") {
            self.punishment = punishment as! Double
        }
    }
    
    mutating func smokeExtra() {
        extra -= 1
        smoke()
    }
    
    mutating func smoke() {
        smokedToday += 1
        smokedTotal += 1
        next = Date().addingTimeInterval(interval)
        save()
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
        save()
        return false
    }
}
