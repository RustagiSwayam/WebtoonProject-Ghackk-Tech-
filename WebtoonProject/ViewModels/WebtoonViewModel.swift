//
//  WebtoonViewModel.swift
//  WebtoonProject
//
//  Created by Swayam Rustagi on 12/10/24.
//

import Foundation

class WebtoonViewModel: ObservableObject {
    @Published var webtoons: [Webtoon] = []
    @Published var favorites: [Webtoon] = []
    @Published var ratings: [UUID: Int] = [:]
    
    private let favoritesKey = "favoritesKey"
    private let ratingsKey = "ratingsKey"
    
    // MARK: - Init methods
    init() {
        fetchWebtoons()
        loadFavorites()
        loadRatings()
    }
    
    // MARK: - Mock Data
    func fetchWebtoons() {
        let mockData = [
            Webtoon(id: UUID(), title: "Hello Baby", thumbnail: "helloBaby", description: "Gwen is a kind and passionate young woman with a tragic backstory. Her mother died when she was young, and her stepmother and stepsister treated her even worse with the demise of her father. Before dying, her father suggests she go on a cruise vacation with her best friend when her partner broke up with her to focus on his career instead. On the vacation, she meets Arthur, a handsome but lonely young man. Things escalate between them when they share their unfortunate fates. They end up hooking up, but Gwen runs away, afraid of the outcome. Fate brings them 2 years later, and they end up in a legal fight when Arthur finds out about his and Gwen’s child. Read Hello Baby to learn whether they can solve their differences."),
            Webtoon(id: UUID(), title: "The Alpha King’s Claim", thumbnail: "alphaKingClaim", description: "A man fights monsters to become the strongest hunter.Do you believe in supernatural creatures like werewolves, vampires, and witches? How would you feel if one day you were transported to a different realm when you touched a painting? The same thing happened with Serena in The Alpha King’s Claim. One rainy day, she buys an interesting painting while taking shelter in a painting shop. When she touched the painting at her home, she got transported to the realm where werewolves lived. Moreover, she ends up on the bed of the Alpha King Aero, who hates all women."),
            Webtoon(id: UUID(), title: "Bitten Contract", thumbnail: "bittenContract", description: "Do you believe vampires exist? What would your first reaction be if you crossed paths with a vampire? Would you be delighted, terrified, or unsure of how to act? Well, Chae-i certainly had an unusual reaction than the others. Chae-i is an actress who has been in the entertainment industry ever since she can remember. However, she is been having a hard time fitting in with other actors due to the extremely painful headaches she started having a little while ago. As a consequence of this, her professional life started deteriorating."),
            Webtoon(id: UUID(), title: "The Heroine's Stepmother", thumbnail: "heroineStepmother", description: "How would you feel if one day you woke up in the novel you wrote just after dying in the real world? Would you feel ecstatic to have a chance to live again? Or would you feel scared because of the uncertain possibilities and the danger lurking? Daisy is a woman with a kind yet strong personality. Following her death in the real world, she wakes up in the novel she wrote with her nine other friends just for fun. Unfortunately, her living conditions do not change much. However, one random day, she is arrested by the duke’s soldier for helping her friend out."),
            Webtoon(id: UUID(), title: "The Guy Upstairs", thumbnail: "guyUpstairs", description: "The Guy Upstairs follows Rosy, a college undergraduate who is an orphan and barely makes ends meet by working odd jobs. However, her life is not too tough, especially because of her best friend Hawa. She supported and trusted her when nobody else did. However, strangely enough, she hears weird sounds coming from the floor above. One random day she decides to check just for her peace of mind, but wait, why is there a dead body of a woman? Moreover, why is she being dragged by her neighbor upstairs?"),
            Webtoon(id: UUID(), title: "The Runaway", thumbnail: "theRunaway", description: "The Guy Upstairs follows Rosy, a college undergraduate who is an orphan and barely makes ends meet by working odd jobs. However, her life is not too tough, especially because of her best friend Hawa. She supported and trusted her when nobody else did. However, strangely enough, she hears weird sounds coming from the floor above. One random day she decides to check just for her peace of mind, but wait, why is there a dead body of a woman? Moreover, why is she being dragged by her neighbor upstairs?"),
            Webtoon(id: UUID(), title: "Your Smile is a Trap", thumbnail: "smileIsATrap", description: "Do you believe that people judge others based on their outer appearance? Have you ever been judged based on your looks? Kiyo is an ex-idol trainee who wants to live like a normal teenager. In this attempt, he starts living with his grandmother and enrolls in a new school. He even starts wearing ugly-looking glasses to hide his exceptional looks. There, he meets Lily, another victim of the same thing. People fear her and her father just because of their scary features, even though they are nice. However, Kiyu makes the same mistakes as others and judges Lily just like everyone else. Gradually, Kiyu realizes his mistake and the fact that Lily is really nice and kind. Read Your Smile Is A Trap to learn about their blossoming love and the obstacles they face."),
            Webtoon(id: UUID(), title: "There must be Happy Endings", thumbnail: "happyEndings", description: "If you ever get a chance to go back and change things you regret now, would you do it? Yeonu is a young and beautiful woman married to Seonjae, a cold and handsome businessman. Her marriage was of convenience and hence there is no love between her and her husband. They tried running the marriage, but ultimately, Yeonu gave up, and they divorced. Due to a series of unfortunate events, Seonjae dies in front of her. However, fate gives her a second chance, and she vows to save Seonjae this time. Read There Must Be Happy Endings to find out whether or not Yeonu was able to save Seonjae and why Seonjae seems to be hiding several secrets."),
            Webtoon(id: UUID(), title: "Seasons of Blossoms", thumbnail: "seasonBlossoms", description: "If you ever get a chance to go back and change things you regret now, would you do it? Yeonu is a young and beautiful woman married to Seonjae, a cold and handsome businessman. Her marriage was of convenience and hence there is no love between her and her husband. They tried running the marriage, but ultimately, Yeonu gave up, and they divorced. Due to a series of unfortunate events, Seonjae dies in front of her. However, fate gives her a second chance, and she vows to save Seonjae this time. Read There Must Be Happy Endings to find out whether or not Yeonu was able to save Seonjae and why Seonjae seems to be hiding several secrets."),
            Webtoon(id: UUID(), title: "Romance 101", thumbnail: "the_boxer", description: "Are you an organized person who keeps track of every detail, disregarding how insignificant it may be, or are you a messy person who goes with the flow? Bareum is a very organized person who even maintains a diary detailing all her events and commitments. She has always had great marks and a clear record of what she wants to do in the future. However, one thing that she has not had any luck with is making a boyfriend. She decides to do things a little differently to achieve this goal and hence joins a programming club despite her planner being full. Fate has different plans in store for her. Read the popular webtoon Romance 101 to find out whether or not she was able to achieve this goal.")
        ]
        webtoons = mockData
    }
    
    // MARK: - Favorites Manager
    
    func addToFavorites(_ webtoon: Webtoon) {
        if !favorites.contains(where: { $0.id == webtoon.id }) {
            favorites.append(webtoon)
            saveFavorites()
        }
    }
    
    func removeFromFavorites(_ webtoon: Webtoon) {
        favorites.removeAll(where: { $0.id == webtoon.id })
        saveFavorites()
    }
    
    private func saveFavorites() {
        if let encoded = try? JSONEncoder().encode(favorites) {
            UserDefaults.standard.set(encoded, forKey: favoritesKey)
        }
    }
    
    private func loadFavorites() {
        if let savedData = UserDefaults.standard.data(forKey: favoritesKey),
           let decoded = try? JSONDecoder().decode([Webtoon].self, from: savedData) {
            favorites = decoded
        }
    }
    
    // MARK: - Ratings Manager
    
    func saveRating(for webtoon: Webtoon, rating: Int) {
        guard ratings[webtoon.id] == nil else {
            print("Webtoon already rated")
            return
        }
        
        ratings[webtoon.id] = rating
        saveRatings()
    }
    
    func loadRating(for webtoon: Webtoon) -> Int {
        return ratings[webtoon.id] ?? 0
    }
    
    private func saveRatings() {
        let ratingsData = ratings.mapKeys { $0.uuidString }
        UserDefaults.standard.set(ratingsData, forKey: ratingsKey)
    }
    
    private func loadRatings() {
        if let savedRatings = UserDefaults.standard.dictionary(forKey: ratingsKey) as? [String: Int] {
            ratings = savedRatings.reduce(into: [:]) { dict, pair in
                if let uuid = UUID(uuidString: pair.key) {
                    dict[uuid] = pair.value
                }
            }
        }
    }
}

extension Dictionary {
    func mapKeys<T: Hashable>(_ transform: (Key) -> T) -> [T: Value] {
        var result: [T: Value] = [:]
        for (key, value) in self {
            result[transform(key)] = value
        }
        return result
    }
}
