//
//  ModelDefinition.swift
//  TrantorBooksAPI
//
//  Created by Aitor Salgado on 18/2/23.
//

import Foundation

struct Book: Codable, Identifiable, Hashable {
    let id: Int
    let isbn: String?
    let author: UUID
    let rating: Double?
    let title: String
    let plot: String?
    let cover: URL?
    let summary: String?
    let pages: Int?
    let year: Int
    let price: Double
}

#if DEBUG
extension Book {
    static let bookTest = Book(id: 1, isbn: "0451528557", author: UUID(uuidString: "531EDFA6-A361-4E15-873F-45E4EA0AF120")!, rating: 3.87, title: "The Time Machine", plot: "The book's protagonist is an English scientist and gentleman inventor living in Richmond, Surrey, in Victorian England, and identified by a narrator simply as the Time Traveller. The narrator recounts the Traveller's lecture to his weekly dinner guests that time is simply a fourth dimension and his demonstration of a tabletop model machine for travelling through it. He reveals that he has built a machine capable of carrying a person through time, and returns at dinner the following week to recount a remarkable tale, becoming the new narrator.\nIn the new narrative, the Time Traveller tests his device with a journey that takes him to A.D. 802,701, where he meets the Eloi, a society of small, elegant, childlike adults. They live in small communities within large and futuristic yet slowly deteriorating buildings, doing no work and having a frugivorous diet. His efforts to communicate with them are hampered by their lack of curiosity or discipline, and he speculates that they are a peaceful, communist society, the result of humanity conquering nature with technology, and subsequently evolving to adapt to an environment in which strength and intellect are no longer advantageous to survival.\nReturning to the site where he arrived, the Time Traveller is shocked to find his time machine missing and eventually concludes that it has been dragged by some unknown party into a nearby structure with heavy doors, locked from the inside, which resembles a Sphinx. Luckily, he had removed the machine's levers before leaving it (the time machine being unable to travel through time without them). Later in the dark, he is approached menacingly by the Morlocks, ape-like troglodytes who live in darkness underground and surface only at night. Within their dwellings, he discovers the machinery and industry that makes the above-ground paradise possible. He alters his theory, speculating that the human race has evolved into two species: the leisured classes have become the ineffectual Eloi, and the downtrodden working classes have become the brutal light-fearing Morlocks. Deducing that the Morlocks have taken his time machine, he explores the Morlock tunnels, learning that due to a lack of any other means of sustenance, they feed on the Eloi. His revised analysis is that their relationship is not one of lords and servants but of livestock and ranchers. The Time Traveller theorizes that intelligence is the result of and response to danger; with no real challenges facing the Eloi, they have lost the spirit, intelligence, and physical fitness of humanity at its peak.\nMeanwhile, he saves an Eloi named Weena from drowning as none of the other Eloi take any notice of her plight, and they develop an innocently affectionate relationship over the course of several days. He takes Weena with him on an expedition to a distant structure that turns out to be the remains of a museum, where he finds a fresh supply of matches and fashions a crude weapon against Morlocks, whom he must fight to get back his machine. He plans to take Weena back to his own time. Because the long and tiring journey back to Weena's home is too much for them, they stop in the forest, and they are then overcome by Morlocks in the night, and Weena faints. The Traveller escapes when a small fire he had left behind them to distract the Morlocks catches up to them as a forest fire; Weena and the pursuing Morlocks are lost in the fire, and the Time Traveler is devastated over his loss.\nThe Morlocks open the Sphinx and use the time machine as bait to capture the Traveller, not understanding that he will use it to escape. He reattaches the levers before he travels further ahead to roughly 30 million years from his own time. There he sees some of the last living things on a dying Earth: menacing reddish crab-like creatures slowly wandering the blood-red beaches chasing enormous butterflies in a world covered in simple lichenous vegetation. He continues to make short jumps through time, seeing Earth's rotation gradually cease and the sun grow larger, redder, and dimmer, and the world falling silent and freezing as the last degenerate living things die out.\nOverwhelmed, he goes back to the machine and returns to Victorian time, arriving at his laboratory just three hours after he originally left. Interrupting dinner, he relates his adventures to his disbelieving visitors, producing as evidence two strange white flowers Weena had put in his pocket. The original narrator then takes over and relates that he returned to the Time Traveller's house the next day, finding him preparing for another journey. After promising to return in a short period of time, the narrator reveals that after 3 years of waiting, the Time Traveller has never returned.", cover: URL(string: "https://images.gr-assets.com/books/1327942880l/2493.jpg"), summary: "The Time Machine is a science fiction novel by H. G. Wells, published in 1895 and written as a frame narrative. Wells is generally credited with the popularization of the concept of time travel by using a vehicle that allows an operator to travel purposely and selectively forwards or backwards in time. The term \"time machine\", coined by Wells, is now almost universally used to refer to such a vehicle.\nThe Time Machine has been adapted into three feature films of the same name, as well as two television versions, and a large number of comic book adaptations. It has also indirectly inspired many more works of fiction in many media productions.", pages: 118, year: 1985, price: 11.84)
}
#endif

struct AuthorDetail: Codable, Identifiable, Hashable {
    let id: UUID
    let name: String
}

struct UserDetail: Codable {
    let email:String
    var location:String? = nil
    var name:String? = nil
    var role: String? = nil
}

#if debug
extension UserDetail {
    static let userTest = UserDetail(email: "barril_establecer0o@icloud.com", location: "Segunda Fundación", name: "Aitor Salgado", role: "admin")
}
#endif
