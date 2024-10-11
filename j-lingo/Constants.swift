//
//  Constants.swift
//  j-lingo
//
//  Created by as on 6/12/24.
//

import Foundation
import UIKit


struct Constants{}

extension Constants{
    
    struct PDFFlags {
        
        static let wx = "w_X"
        static let wy = "w_Y"
        static let wz = "w_Z"
        static let hiragana = "hiragana"
        static let katakana = "katakana"
        static let kanji = "kanji"
        static let gx = "G_X"
        static let gy = "G_Y"
        static let gz = "G_Z"
    
    }
    
    struct Links {
        static let shareProfile = "https://chowdhurynawaf.github.io/Share_Bjet_Profile/"
    }

    struct Kanji  {
        
        static let k1: [String: String] = [
            "上": "Above",
            "下": "Below",
            "大": "Big",
            "工": "Construction",
            "八": "Eight",
            "入": "Enter",
            "山": "Mountain",
            "口": "Mouth",
            "九": "Nine",
            "一": "One",
            "人": "Person",
            "力": "Power",
            "川": "River",
            "七": "Seven",
            "十": "Ten",
            "三": "Three",
            "二": "Two",
            "女": "Woman"
        ]
    }
    
    struct QuizURl {
        
        static let DQ_1 = "https://docs.google.com/forms/d/e/1FAIpQLScPsOAGhJvEazoGUN7y0Fm1qYIdYGU04vgRn0QiGv1pVGcubQ/viewform?hr_submission=ChkI7bnB-pkUEhAI2_y19b8TEgcI3fiY9b8TEAE"
        
        static let WQ_1 = "https://docs.google.com/forms/d/e/1FAIpQLSdprh0g966v031JAmnQgXvEsCprr-N0FW-vP4VQdXm89iaiXw/viewform?hr_submission=ChkI7bnB-pkUEhAI0fy19b8TEgcI3fiY9b8TEAE"
    }
    
    struct WH {
        
        static let dic: [String: String] = [
            "誰 (だれ, dare)": "Who",
            "何 (なに, nani)": "What",
            "どこ (doko)": "Where",
            "いつ (itsu)": "When",
            "なぜ (formal)": "Why",
            "どうして (informal)": "Why",
            "どのように (in what manner)": "How",
            "どうやって (by what means)": "How",
            "どちら (formal)": "Which",
            "どれ (informal)": "Which",
            "いくつ (for countable objects)": "How many",
            "いくら (for price or amount)": "How much",
            "どんな (donna)": "What kind of",
            "どの (specific among many)": "Which",
            "なんで (informal, conversational)": "Why",
            "知っていますか" : "do you know"
            
        ]
    }
    
    static let colorArray: [UIColor] = [
        .black,
        .darkGray,
        .lightGray,
        .gray,
        .red,
        .green,
        .blue,
        .cyan,
        .yellow,
        .magenta,
        .orange,
        .purple,
        .brown,
        .clear
    ]
    
    struct Convo {
        static let conversations: [(String, String)] = [
            
            ("How was your weekend?", "Pretty relaxing, spent most of it reading."),
            ("Are you coming to the party tonight?", "Yeah, I'll be there around 8 PM."),
            ("Did you get a chance to finish the book?", "Yes, I loved the ending, very unexpected."),
            ("What are you doing after work?", "Just heading home to cook dinner and relax."),
            ("Have you seen the latest episode?", "Not yet, I'm planning to watch it tonight."),
            ("What do you think of the new office layout?", "It's nice, but I miss having my own space."),
            ("Are you free for lunch tomorrow?", "Sure, let's meet at the usual place around noon."),
            ("How's your project going?", "It's progressing slowly, but I'm making steady progress."),
            ("Did you hear about the new policy?", "Yes, it seems like a positive change."),
            ("What are your weekend plans?", "I'm thinking of going hiking if the weather is nice."),
            ("Did you check out that new restaurant?", "Yes, the food was great, highly recommend it."),
            ("Are you joining us for the meeting?", "I'll be there, just wrapping up a few things first."),
            ("How's the family doing?", "Everyone's doing well, thanks for asking."),
            ("What time are we leaving tomorrow?", "Let's aim to leave around 9 AM."),
            ("Did you get my email?", "Yes, I saw it this morning, I'll reply soon."),
            ("Are you excited for the trip?", "Definitely, I've been looking forward to it."),
            ("What's the best way to reach you?", "Texting is usually the quickest way."),
            ("Are you ready for the presentation?", "Almost, just need to review a few more slides."),
            ("Have you decided on dinner?", "I'm thinking about ordering pizza."),
            ("Did you enjoy the movie?", "It was alright, but not as good as I expected."),
            ("What are your thoughts on the proposal?", "It seems solid, but I have a few concerns."),
            ("How's the weather looking for the weekend?", "It's supposed to be sunny, perfect for a picnic."),
            ("Are you working from home today?", "Yes, I'll be online all day if you need anything."),
            ("Have you been to the new gym?", "Not yet, but I'm planning to check it out this week."),
            ("Did you get any sleep last night?", "Not much, I stayed up late finishing a project."),
            ("Are you interested in joining the club?", "Sounds fun, I'll think about it."),
            ("What do you think of the new software?", "It's a bit confusing at first, but I'm getting the hang of it."),
            ("Did you find the information you needed?", "Yes, thanks for pointing me in the right direction."),
            ("Are you available for a quick call?", "Sure, give me a few minutes to wrap this up."),
            ("What are your thoughts on the new logo?", "I like it, but it might need some tweaking."),
            ("Did you hear about the event next week?", "Yes, I'm planning to attend."),
            ("Are you still up for dinner tonight?", "Definitely, let's meet at 7 PM."),
            ("How's the new job treating you?", "It's challenging, but I'm learning a lot."),
            ("What time does the meeting start?", "It's scheduled for 10 AM."),
            ("Have you been following the news?", "Yes, it's been pretty intense lately."),
            ("Are you planning to go to the gym today?", "I am, but later in the evening."),
            ("How was your weekend?", "It was great, I spent time with family and friends."),
            ("Did you catch the game last night?", "Yes, it was an exciting match!"),
            ("What do you think about the new project?", "It sounds interesting, I'm eager to start."),
            ("Are you attending the conference next week?", "Yes, I have my tickets already."),
            ("How do you like the new design?", "It's sleek and modern, I think it's a great improvement."),
            ("What did you do last weekend?", "I went hiking and then relaxed at home."),
            ("Are you free this weekend?", "Yes, I'm free on Saturday."),
            ("How's your week been?", "It's been busy, but I'm managing."),
            ("Did you finish the report?", "Yes, I submitted it this morning."),
            ("What's your plan for tonight?", "I'm going to catch up on some reading."),
            ("Are you going to the concert?", "I'm thinking about it, still deciding."),
            ("How do you like the new office?", "It's nice, but I'm still getting used to it."),
            ("Did you hear about the new restaurant?", "Yes, I'm planning to try it soon."),
            ("What time is the meeting?", "It's at 3 PM."),
            ("Are you ready for the trip?", "Almost, just need to pack a few things."),
            ("Did you watch the game last night?", "Yes, it was a close one!"),
            ("What are your plans for the weekend?", "I'm going to visit some friends."),
            ("How do you feel about the new changes?", "I'm optimistic, I think they'll be beneficial."),
            ("Are you attending the workshop?", "Yes, I'm looking forward to it."),
            ("What's your favorite thing about the new job?", "I love the team I'm working with."),
            ("Did you see the email about the meeting?", "Yes, I'll be there."),
            ("Are you coming to the event tonight?", "Yes, I'm excited to see everyone."),
            ("How was your day?", "It was productive, got a lot done."),
            ("What's on your agenda for today?", "I have a few meetings and then some work on the project."),
            ("Are you available for a quick chat?", "Yes, give me a call whenever you're free."),
            ("Did you get the package I sent?", "Yes, it arrived yesterday."),
            ("How's the weather today?", "It's sunny and warm, perfect for a walk."),
            ("Are you free for coffee this afternoon?", "Sure, let's meet at 2 PM."),
            ("What did you think of the presentation?", "It was informative, but a bit long."),
            ("Are you interested in joining the new project?", "Definitely, it sounds right up my alley."),
            ("How do you like the new phone?", "It's great, the camera is amazing."),
            ("Did you get a chance to look at the proposal?", "Yes, I think it has potential."),
            ("Are you planning to travel this summer?", "Yes, I'm thinking of going to the mountains."),
            ("How's the new place?", "It's cozy, I really like it."),
            ("What's your favorite part of the day?", "Evenings, when I can relax."),
            ("Did you see the latest movie?", "Not yet, but it's on my list."),
            ("Are you going to the team dinner?", "Yes, I'm looking forward to it."),
            ("How was the meeting?", "It was productive, we covered a lot."),
            ("What's your go-to snack?", "I love a good granola bar."),
            ("Did you hear the news this morning?", "Yes, it's been all over social media."),
            ("Are you free to help with the project?", "Sure, just let me know what you need."),
            ("How's your new car?", "It's amazing, drives like a dream."),
            ("What's your plan for the weekend?", "I'm planning to relax and maybe catch a movie."),
            ("Did you catch the game last night?", "Yes, it was a nail-biter!"),
            ("Are you ready for the big day?", "Almost, just a few more things to prepare."),
            ("How do you like the new app?", "It's pretty user-friendly, I like it."),
            ("What's the plan for tomorrow?", "We're meeting at 10 AM to finalize everything."),
            ("Are you going to the gym today?", "Yes, I plan to go after work."),
            ("How was your vacation?", "It was wonderful, I didn't want to leave!"),
            ("Did you finish the book?", "Yes, it was a great read."),
            ("Are you coming to the office tomorrow?", "Yes, I'll be there in the morning."),
            ("How do you like the new place?", "It's nice, but I miss my old neighborhood."),
            ("What's your favorite kind of music?", "I love indie rock and alternative."),
            ("Did you try the new restaurant?", "Yes, the food was fantastic.")
            
            ]

    }
    
    struct ForumPost {
        static let dummyPosts: [Post] = [
            Post(
                title: "How can someone quicly learn N4 Kanji",
                description: "Quick tips to memorize key Kanji for JLPT N4 is to watch videos and reading books",
                likes: 150,
                comments: 30,
                imageName: "man1",
                postedDay: "3 days ago",
                personName: "Nayem sheikh"
            ),
            Post(
                title: "N5 Vocabulary Essentials",
                description: "Top 100 words you need to know for JLPT N5.",
                likes: 200,
                comments: 40,
                imageName: "man2",
                postedDay: "1 week ago",
                personName: "Goto goro"
                
            ),
            Post(
                title: "Understanding N4 Grammar",
                description: "A breakdown of complex N4 grammar points.",
                likes: 175,
                comments: 35,
                imageName: "man3",
                postedDay: "5 days ago",
                personName: "Jayem Khan"
            ),
            Post(
                title: "Kanji Practice Techniques",
                description: "Effective methods to improve your Kanji recall.",
                likes: 120,
                comments: 25,
                imageName: "man1",
                postedDay: "2 days ago",
                personName: "Hanami desh"
            ),
            Post(
                title: "Listening Skills for JLPT",
                description: "Enhance your listening skills for the JLPT exams.",
                likes: 140,
                comments: 20,
                imageName: "man2",
                postedDay: "4 days ago",
                personName: "Uri koko"
            ),
            Post(
                title: "Daily Japanese Phrases",
                description: "Common phrases to use in everyday conversation.",
                likes: 160,
                comments: 28,
                imageName: "man3",
                postedDay: "1 day ago",
                personName: "Hyden burg"
            )
        ]

    }
    
    struct Notification {
      

      static  func generateDummyNotifications() -> [NotificationModel] {
            var notifications = [NotificationModel]()
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .short
            
            let contents = [
                "Weekly quiz WQ_9 has been published",
                "Daily quiz DQ_7 has been published",
                "You got a new message",
                "Notice from admin",
                "Your subscription will expire soon",
                "System maintenance scheduled",
                "New feature updates available",
                "Weekly quiz WQ_10 has been published",
                "Daily quiz DQ_8 has been published",
                "You have a new friend request",
                "Admin announcement",
                "Reminder: Complete your profile",
                "Congratulations! You achieved a new milestone",
                "Security alert: Unusual login detected",
                "Your quiz results are ready",
                "Weekly quiz WQ_11 has been published",
                "Daily quiz DQ_9 has been published",
                "New course available for you",
                "Survey: Tell us your feedback",
                "Weekly quiz WQ_12 has been published",
                "Daily quiz DQ_10 has been published",
                "You received a gift",
                "Update your app for new features",
                "New message from support",
                "Important security update",
                "Weekly quiz WQ_13 has been published",
                "Daily quiz DQ_11 has been published",
                "Admin notice: System downtime",
                "Special offer: 50% off",
                "New article in your feed",
                "Weekly quiz WQ_14 has been published",
                "Daily quiz DQ_12 has been published",
                "Friend suggestion for you",
                "Reminder: Complete your task",
                "Update your preferences",
                "Weekly quiz WQ_15 has been published",
                "Daily quiz DQ_13 has been published",
                "New training module added",
                "Maintenance completed successfully",
                "Weekly quiz WQ_16 has been published",
                "Daily quiz DQ_14 has been published",
                "New update available",
                "Don't miss the latest quiz",
                "Admin: Important message for you",
                "Weekly quiz WQ_17 has been published",
                "Daily quiz DQ_15 has been published",
                "Join our upcoming event",
                "Weekly quiz WQ_18 has been published",
                "Daily quiz DQ_16 has been published"
            ]
            
            let symbols = [
                "bell.fill", "envelope.fill", "flag.fill", "star.fill",
                "calendar", "clock.fill", "pencil.circle.fill", "book.fill",
                "person.fill", "bookmark.fill"
            ]
            
            for i in 0..<50 {
                let content = contents[i % contents.count]
                let symbolName = symbols[i % symbols.count]
                let image = UIImage(systemName: symbolName) ?? UIImage()
                let date = dateFormatter.string(from: Date().addingTimeInterval(TimeInterval(-i * 3600)))
                
                let notification = NotificationModel(image: image, content: content, date: date)
                notifications.append(notification)
            }
            
            return notifications
        }

        let dummyNotifications = generateDummyNotifications()

    }

    struct Font {
        static let poppins_regular = "Poppins-Regular"
        static let poppins_bold = "Poppins-Bold"
        static let poppins_semiBold = "Poppins-SemiBold"
        static let poppins_medium = "Poppins-Medium"
    }
    
    struct Screen {
        static let screenwidth = UIScreen.main.bounds.width
        static let screenheight = UIScreen.main.bounds.height
    }
    struct Colors {
        
        static let appcolor: UIColor = UIColor(hex: "#FB281C")!
        static let neogreen : UIColor = UIColor.systemGreen.withAlphaComponent(0.6)
        static let github1 = UIColor(hex: "#2DBA4E")
        static let github2 = UIColor(hex: "#9BE9A8")
        static let github3 = UIColor(hex: "#30A14E")
    }
    
    struct PromotionResource {
        static let kanji = Promotion(img: "uzwa", link: "https://www.youtube.com/watch?v=Gt6amdxV4J8&list=PLtDqRGyNUTWg99QNyLi7HynizwV24RLRA&index=1")
        static let resume = Promotion(img: "resume", link: "https://www.youtube.com/watch?v=tPMVFEybL08")
        static let session = Promotion(img: "session", link: "https://forms.gle/gjbyXHuZsnRjU5Ef6")
        static let skill = Promotion (img :"skill", link: "https://www.youtube.com/watch?v=Z8zTST7Sf8g")
        
    }

    
    struct Courses {
        
        static let c1 = Course(title: "Master N4 Kanji in Weeks", name: "Joyonto Roy", rating: 4.5,img: "t1")
        static let c2 = Course(title: "N5 Vocabulary for Daily Life", name: "Jubayer Ahmed", rating: 4.5,img: "t2")
        static let c3  = Course(title: "Quick Guide to N4 Grammar", name: "Sina Sardar", rating: 4.5,img: "t3")
        
        static let c4 = Course(title: "N5 Vocabulary Essentials for Beginners", name: "Joyonto Roy", rating: 4.5,img: "t4")
        static let c5 = Course(title: "N5 Vocabulary for Daily life", name: "Jubayer Ahmed", rating: 4.5,img: "t5")
        static let c6  = Course(title: "Comprehensive N4 Grammar Breakdown", name: "Sina Sardar", rating: 4.5,img: "t6")
        static let c7  = Course(title: "Essential N5 Vocabulary in Practical", name: "Sina Sardar", rating: 4.5,img: "t7")
        static let c8  = Course(title: "N4 Kanji Mastery: Key Characters", name: "Sina Sardar", rating: 4.5,img: "t8")
        
        
    }
    
    struct Practice {
        static let hiragana = Book(name: "Hiragana", img: "h1", link: "https://a1.marugotoweb.jp/en/hiragana.php")
        static let katakana = Book(name: "katakana", img: "kt1", link: "https://a1.marugotoweb.jp/en/hiragana.php")
        static let kanji = Book(name: "Kanji", img: "kn1", link: "https://www.wanikani.com/kanji/")
        static let word = Book(name: "Vocabulary", img: "v1", link: "https://www.irodori.jpf.go.jp/assets/data/wordlist_X.pdf")
        static let grammar = Book(name: "Grammar", img: "g1", link: "https://www.irodori.jpf.go.jp/assets/data/resources/Grammar_Worksheets_X.pdf")
        static let ai = Book(name: "Ai", img: "ai", link: "https://www.irodori.jpf.go.jp/assets/data/resources/Grammar_Worksheets_X.pdf")
        static let wh = Book(name: "WH question", img: "who" , link: "")
        static let professional = Book(name: "Professional", img: "professional", link: "")
        static let confusion = Book(name: "Confusion", img: "confusion", link: "")
        
        static var arr: [Book] {
                return [ai, hiragana, katakana, kanji, word, grammar,wh,professional,confusion]
            }
    }
    
    struct HomeResource {
            
        static let hiragana = Book(name: "Hiragana", img: "hiragana", link: "https://a1.marugotoweb.jp/en/hiragana.php")
        static let katakana = Book(name: "katakana", img: "katakana", link: "https://a1.marugotoweb.jp/en/hiragana.php")
        static let kanji = Book(name: "Kanji", img: "kanji", link: "https://www.wanikani.com/kanji/")
        static let textBook1 = Book(name: "Text Book 1", img: "Text Book 1", link: "https://www.irodori.jpf.go.jp/assets/data/starter/pdf/X_all.pdf")
        static let textBook2  = Book(name: "Text Book 2", img: "Text Book 2", link: "https://www.irodori.jpf.go.jp/assets/data/elementary01/pdf/Y_all.pdf")
        static let textBook3  = Book(name: "Text Book 3", img: "Text Book 3", link: "https://www.irodori.jpf.go.jp/assets/data/elementary02/pdf/Z_all.pdf")
        static let word1 = Book(name: "Word List 1", img: "Word List 1", link: "https://www.irodori.jpf.go.jp/assets/data/wordlist_X.pdf")
        static let word2 = Book(name: "Word List 2", img: "Word List 2", link: "https://www.irodori.jpf.go.jp/assets/data/wordlist_Y.pdf")
        static let word3 = Book(name: "Word List 3", img: "Word List 3", link: "https://www.irodori.jpf.go.jp/assets/data/wordlist_Z.pdf")
        static let grammar1 = Book(name: "Grammar 1", img: "Grammar 1", link: "https://www.irodori.jpf.go.jp/assets/data/resources/Grammar_Worksheets_X.pdf")
        static let grammar2 = Book(name: "Grammar 2", img: "Grammar 2", link: "https://www.irodori.jpf.go.jp/assets/data/resources/Grammar_Worksheets_Y.pdf")
        static let grammar3 = Book(name: "Grammar 3", img: "Grammar 3", link: "https://www.irodori.jpf.go.jp/assets/data/resources/Grammar_Worksheets_Z.pdf")
        static let grammarNotes = Book(name: "Grammar Notes", img: "Grammar Notes", link: "https://www.irodori.jpf.go.jp/assets/data/Grammar_all.pdf")
        
        // Adding 18 pptx dummy data to each term array
        static let pptxDataTerm1 =  Book(name: "X", img: "pptx1", link: "https://classroom.google.com/c/NjY5OTkyMjM4MTcz/m/NjY5OTkyMjM4NDg0/details")
        static let pptxDataTerm2 =  Book(name: "Y", img: "pptx2", link: "https://classroom.google.com/c/NjY5OTkyMjM4MTcz/m/NjY5OTkyMjM4NDg0/details")
        static let pptxDataTerm3 =  Book(name: "Z", img: "pptx1", link: "hhttps://classroom.google.com/c/NjY5OTkyMjM4MTcz/m/NjY5OTkyMjM4NDg0/details") 
        
        static var term1Arr: [Book] = [hiragana, katakana, kanji, textBook1, word1, grammar1]
        static var term2Arr: [Book] = [textBook2, word2, grammar2]
        static var term3Arr: [Book] = [textBook3, word3, grammar3, grammarNotes]
        static var pptxArr: [Book] = [pptxDataTerm1,pptxDataTerm2,pptxDataTerm3]

  }
    
    
  struct Katakana {
        
        static let katakanaDictionary: [String: String] = [
            "ア": "a",    "イ": "i",    "ウ": "u",    "エ": "e",    "オ": "o",
            "カ": "ka",   "キ": "ki",   "ク": "ku",   "ケ": "ke",   "コ": "ko",
            "サ": "sa",   "シ": "shi",  "ス": "su",   "セ": "se",   "ソ": "so",
            "タ": "ta",   "チ": "chi",  "ツ": "tsu",  "テ": "te",   "ト": "to",
            "ナ": "na",   "ニ": "ni",   "ヌ": "nu",   "ネ": "ne",   "ノ": "no",
            "ハ": "ha",   "ヒ": "hi",   "フ": "fu",   "ヘ": "he",   "ホ": "ho",
            "マ": "ma",   "ミ": "mi",   "ム": "mu",   "メ": "me",   "モ": "mo",
            "ヤ": "ya",               "ユ": "yu",               "ヨ": "yo",
            "ラ": "ra",   "リ": "ri",   "ル": "ru",   "レ": "re",   "ロ": "ro",
            "ワ": "wa",                          "ヲ": "wo",
            "ン": "n"
        ]
        
       static let katakanaWithDiacriticsDictionary: [String: String] = [
            "ガ": "ga",   "ギ": "gi",   "グ": "gu",   "ゲ": "ge",   "ゴ": "go",
            "ザ": "za",   "ジ": "ji",   "ズ": "zu",   "ゼ": "ze",   "ゾ": "zo",
            "ダ": "da",   "ヂ": "ji",   "ヅ": "zu",   "デ": "de",   "ド": "do",
            "バ": "ba",   "ビ": "bi",   "ブ": "bu",   "ベ": "be",   "ボ": "bo",
            "パ": "pa",   "ピ": "pi",   "プ": "pu",   "ペ": "pe",   "ポ": "po"
        ]

        static let katakanaCombinationsDictionary: [String: String] = [
            "キャ": "kya", "キュ": "kyu", "キョ": "kyo",
            "シャ": "sha", "シュ": "shu", "ショ": "sho",
            "チャ": "cha", "チュ": "chu", "チョ": "cho",
            "ニャ": "nya", "ニュ": "nyu", "ニョ": "nyo",
            "ヒャ": "hya", "ヒュ": "hyu", "ヒョ": "hyo",
            "ミャ": "mya", "ミュ": "myu", "ミョ": "myo",
            "リャ": "rya", "リュ": "ryu", "リョ": "ryo",
            "ギャ": "gya", "ギュ": "gyu", "ギョ": "gyo",
            "ジャ": "ja",  "ジュ": "ju",  "ジョ": "jo",
            "ビャ": "bya", "ビュ": "byu", "ビョ": "byo",
            "ピャ": "pya", "ピュ": "pyu", "ピョ": "pyo"
        ]
        
        static var combinedKatakanaDictionary = Helper.combineDictionaries(katakanaDictionary,katakanaCombinationsDictionary,katakanaWithDiacriticsDictionary)
    }
    
    struct Hiragana {
        
        
        
       static let hiraganaWithDiacriticsDictionary: [String: String] = [
            "が": "ga",   "ぎ": "gi",   "ぐ": "gu",   "げ": "ge",   "ご": "go",
            "ざ": "za",   "じ": "ji",   "ず": "zu",   "ぜ": "ze",   "ぞ": "zo",
            "だ": "da",   "ぢ": "ji",   "づ": "zu",   "で": "de",   "ど": "do",
            "ば": "ba",   "び": "bi",   "ぶ": "bu",   "べ": "be",   "ぼ": "bo",
            "ぱ": "pa",   "ぴ": "pi",   "ぷ": "pu",   "ぺ": "pe",   "ぽ": "po"
        ]
        
       static let hiraganaCombinationsDictionary: [String: String] = [
            "きゃ": "kya", "きゅ": "kyu", "きょ": "kyo",
            "しゃ": "sha", "しゅ": "shu", "しょ": "sho",
            "ちゃ": "cha", "ちゅ": "chu", "ちょ": "cho",
            "にゃ": "nya", "にゅ": "nyu", "にょ": "nyo",
            "ひゃ": "hya", "ひゅ": "hyu", "ひょ": "hyo",
            "みゃ": "mya", "みゅ": "myu", "みょ": "myo",
            "りゃ": "rya", "りゅ": "ryu", "りょ": "ryo",
            "ぎゃ": "gya", "ぎゅ": "gyu", "ぎょ": "gyo",
            "じゃ": "ja",  "じゅ": "ju",  "じょ": "jo",
            "びゃ": "bya", "びゅ": "byu", "びょ": "byo",
            "ぴゃ": "pya", "ぴゅ": "pyu", "ぴょ": "pyo"
        ]


        
       static let hiraganaDictionary: [String: String] = [
            "あ": "a",    "い": "i",    "う": "u",    "え": "e",    "お": "o",
            "か": "ka",   "き": "ki",   "く": "ku",   "け": "ke",   "こ": "ko",
            "さ": "sa",   "し": "shi",  "す": "su",   "せ": "se",   "そ": "so",
            "た": "ta",   "ち": "chi",  "つ": "tsu",  "て": "te",   "と": "to",
            "な": "na",   "に": "ni",   "ぬ": "nu",   "ね": "ne",   "の": "no",
            "は": "ha",   "ひ": "hi",   "ふ": "fu",   "へ": "he",   "ほ": "ho",
            "ま": "ma",   "み": "mi",   "む": "mu",   "め": "me",   "も": "mo",
            "や": "ya",               "ゆ": "yu",               "よ": "yo",
            "ら": "ra",   "り": "ri",   "る": "ru",   "れ": "re",   "ろ": "ro",
            "わ": "wa",                          "を": "wo",
            "ん": "n"
        ]
        
        static var combinedHiraganaDictionary = Helper.combineDictionaries(hiraganaDictionary,hiraganaCombinationsDictionary,hiraganaWithDiacriticsDictionary)

    }
}

struct Book {
    let name : String
    let img : String
    let link : String
}

struct Promotion {
    let img : String
    let link : String
}

struct Course {
    let title : String
    let name : String
    let rating : Double
    let img : String
}

struct NotificationModel {
    let image: UIImage
    let content: String
    let date: String
}

struct MessageList {
    
    let animationName : String
    let name:String
    let message:String
    
}

enum CVTag : Int {
    case resource
    case promotion
    case DQ
    case WQ
    case Courses
    case Books
    case OClass
    case Pt
}

enum PracticeFlag : Int {
    case hiragana
    case katakana
    case wh
    case kanji
    case kanjiword
    case sentence
    case vocabs
}

struct Post {
    let title: String
    let description: String
    let likes: Int
    let comments: Int
    let imageName: String
    let postedDay: String
    let personName : String
}

