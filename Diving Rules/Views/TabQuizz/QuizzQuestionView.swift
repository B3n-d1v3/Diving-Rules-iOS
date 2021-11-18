//
//  QuizzQuestion.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 11/03/2021.
//

import SwiftUI

//enum PenaltySanction {
//    case zeroPts, maxTwoPts, 
//}

struct QuizzQuestionView: View {
    // QuizzStart >> [[QuizzQuestion]] (looped) >> QuizzResult
    
    // To handle the Quizz Quit
    @Binding var shouldPopToRootView: Bool
    
    // Quizz Context: Question list
    var questionList: [Int]
    @State private var score = 0
    @State private var currentQuestion = 0
    
    
    // User Answer Management
    @State private var askForAnswer = false
    @State private var nextQuestion = false
    @State private var lastQuestion = false
    
    @ObservedObject var penaltyButtonStatus: ButtonsStatus
    
    // Language switch to EN variables
    @EnvironmentObject var language: LanguageSettings
    @State private var penaltyDescriptionTranslation = ""
    
    
    var body: some View {
        let penalty = penalties[questionList[currentQuestion]]
        
        ScrollView {
            // Scrolling View for the rule except the bottom buttons
            VStack(alignment: .leading) {
                //Rule Description
                VStack (alignment: .leading) {
                    HStack {
                        Text("Quizz-Question")
                        Text(" \(currentQuestion+1)")
                    }
                    .font(.title)
                    .foregroundColor(Color.accentColor)
                    .padding(.bottom, 1.0)
                    
                    HStack {
                        Text("Penalty-Description")
                            // the rest of the style
                            .font(.title2)
                            .foregroundColor(Color.accentColor)
                            .padding(.bottom)
                        Spacer()
                        // Do not show the button when default Language is EN
                        if language.app != "en" {
                            // Button to switch to EN
                            Button {
                                if (language.current != "en"){
                                    language.current = "en"
                                } else {
                                    language.current = language.app
                                }
                                print("[QuizzQuestion > FlagButton] language.current = \(language.current) / language.app = \(language.app)")
                            } label: {
                                // Show the current language
                                Text(selectFlag(of:language.current))
                                Image (systemName: "arrow.left.arrow.right")
                                    .resizable()
                                    .frame(width: 15.0, height: 15.0)
                                    .opacity(0.4)
                                // Show the target language
                                if (language.current != "en") {
                                    Text(language.englishFlag)
                                        .opacity(0.4)
                                } else {
                                    Text(selectFlag(of:language.app))
                                        .opacity(0.4)
                                }
                            } // Button Label
                        } // if the deflaut language is not EN show the button
                    } // HSTack Penalty Title
                    
                    let penaltyDescription = "Penalty-" + String(penalty.id)

                    // Allow PenaltyDescription language selection
                    let pathLanguage = Bundle.main.path(forResource: language.current, ofType: "lproj")
                    let bundleLanguage = Bundle(path: pathLanguage!)
                    let penaltyDescriptionTranslation = bundleLanguage?.localizedString(forKey: penaltyDescription, value: nil, table: nil)
                    
                    Text(penaltyDescriptionTranslation!)
                        .fixedSize(horizontal: false, vertical: true)
                } // VStack Penalty Description
                
                Spacer()
                Divider ()
                
                //What is the saction for this penalty
                Text("Penalty-Penalty")
                    .font(.title2)
                    .foregroundColor(Color.accentColor)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom)
                
                VStack(alignment: .center) {
                    // Penalties: What sanction is appropriate
                    HStack{
                        //Penalty Line 1
                        Spacer ()
                        // 0 pts
                        PenaltySelectionButton (buttonImage: "0.circle", buttonText: NSLocalizedString("Button-0pts", comment: "Button Description"), isOn: $penaltyButtonStatus.penaltyZeroPts, sanctionID: 0, nextQuestion: $nextQuestion)
                        
                        Spacer ()
                        // Max 2 pts
                        PenaltySelectionButton (buttonImage: "lessthan.circle.fill", buttonText: NSLocalizedString("Button-max2pts", comment: "Button Description"), isOn: $penaltyButtonStatus.penaltyMaxTwoPts, sanctionID: 2, nextQuestion: $nextQuestion)
                        
                        Spacer ()
                        // Max 4 1/2 pts
                        PenaltySelectionButton (buttonImage: "lessthan.circle", buttonText: NSLocalizedString("Button-max4halfpts", comment: "Button Description"), isOn: $penaltyButtonStatus.penaltyMaxFourHalfPts, sanctionID: 3, nextQuestion: $nextQuestion)
                        
                        Spacer ()
                    } // HStack Penalty Line 1
                    HStack{
                        //Penalty Line 2
                        Spacer ()
                        // -2 pts
                        PenaltySelectionButton (buttonImage: "gobackward.minus", buttonText: NSLocalizedString("Button--2pts", comment: "Button Description"), isOn: $penaltyButtonStatus.penaltyMinusTwoPts, sanctionID: 1, nextQuestion: $nextQuestion)
                        
                        Spacer ()
                        // -1/2 to 2 pts
                        PenaltySelectionButton (buttonImage: "arrow.left.and.right.circle", buttonText: NSLocalizedString("Button--halfto2pts", comment: "Button Description"), isOn: $penaltyButtonStatus.penaltyMinusHalfToTwoPts, sanctionID: 4, nextQuestion: $nextQuestion)
                        
                        Spacer ()
                        // judge Opinion
                        PenaltySelectionButton (buttonImage: "plusminus.circle", buttonText: NSLocalizedString("Button-judgeOpinion", comment: "Button Description"), isOn: $penaltyButtonStatus.penaltyJudgeOpinion, sanctionID: 5, nextQuestion: $nextQuestion)
                        Spacer ()
                    } // HStack Penalty Line 2
                } // VStack Penalty Buttons
                Divider ()
                // Ownership : who is can take the sanction
                Text("Penalty-Ownership")
                    .font(.title2)
                    .foregroundColor(Color.accentColor)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom)
                
                VStack {
                    HStack {
                        Spacer ()
                        // Ownership Referee
                        OwnershipRefereeButton (isOn: $penaltyButtonStatus.ownershipReferee, nextQuestion: $nextQuestion)
                        
                        Spacer ()
                        Spacer ()
                        // Ownership Judge
                        OwnershipJudgeButton (isOn: $penaltyButtonStatus.ownershipJudge, nextQuestion: $nextQuestion)
                        Spacer ()
                    } // HStack Ownership
                    //                    .padding(.horizontal, 30.0)
                } // VStack Ownership
                .frame(alignment: .center)
                
                
                
            } // VStack Rule
            .padding(.all)
            
        } // ScrollView for all rule
        // Header & Exit Button
        .navigationBarTitle("Quizz-Title", displayMode: NavigationBarItem.TitleDisplayMode.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(trailing: Button(action: {
//            print ("[QuizzQuestionView > Quizz Exit]")
//            print (" Exit >>> currentQuizz: \(currentQuizz)")
//            print (" Exit >>> quizzHistory: \(quizzHistory)")
            currentQuizz = Quizz()
            newQuizz(of: questionList.count)
            buttonStatusReset ()
            // Navigation skip example found in https://stackoverflow.com/questions/57334455/swiftui-how-to-pop-to-root-view
            self.shouldPopToRootView = false
        }) {
            Image(systemName: "xmark.circle")
                .accentColor(.accentColor)
                .font(.title)
        })
        
        VStack {
            
//            Spacer ()
            Divider ()
            // Navigation / Score / Question Number
            HStack {
                // Score
                Text(" \(score) pts")
                    .padding(10.0)
                    .foregroundColor(Color.white)
                    .background(Color("Score"))
                    .cornerRadius(20)
                Spacer ()
                //
                Button (action: {
                    lastQuestion = (currentQuestion + 1 >= questionList.count)
    //                print("[Next Button] lastQuestion: \(lastQuestion)")
                    self.nextQuestion(penalty)
                    //                        print("[Next Button] lastQuestion: \(lastQuestion) - penatlyNumber (questionList[currentQuestion]): \(questionList[currentQuestion])")
                }) {
                    Text("Quizz-Next")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .padding(.leading, 10.0)
//                        .padding(5.0)
                    Image (systemName: "chevron.right.circle.fill")
                        .font(.title)
                } // Button
                .padding(5.0)
                .foregroundColor(.white)
                .background((nextQuestion ? Color("AccentColor") : Color.gray))
                .cornerRadius(40)
                NavigationLink(destination: QuizzResultView (shouldPopToRootView: self.$shouldPopToRootView, score: score, questionNumber: questionList.count), isActive: $lastQuestion) {}
                
                Spacer ()
                // Question Number
                Text(" \(currentQuestion+1) / \(questionList.count)")
                    .padding(10.0)
                    .foregroundColor(Color.white)
                    .background(Color("Score"))
                    .cornerRadius(20)
            } // HStack Navigation
            .padding(.bottom, 5.0)
            .padding(.top, 1.0)
            .padding(.horizontal, 10)

            
        } // VStack Navigation
        .padding(.bottom, 2.0)
    } // Body
    
    
    
    
    func nextQuestion(_ penalty : Penalty) {
        //        print("[nextQuestion] userSanctionSelection: \(userSanctionSelection) - ownershipReferee: \(ownershipReferee) - ownershipJudge: \(ownershipJudge)")
        if (penaltyButtonStatus.userSanctionSelection > 6) || (!penaltyButtonStatus.ownershipReferee && !penaltyButtonStatus.ownershipJudge) {
            // Has the user provided an answer at least one penalty and one owner
            askForAnswer = true
            print("[nextQuestion] Missing answer")
        } else {
            // else user has answered items
            if penaltyButtonStatus.userSanctionSelection == penalty.sanctionValue {
                // if the penalty answer is correct
                if (penaltyButtonStatus.ownershipReferee == penalty.referee) && (penaltyButtonStatus.ownershipJudge == penalty.judge) {
                    // if the Ownership answer is correct
                    score += 10
                    print("[nextQuestion] Good answer")
                } else if (penaltyButtonStatus.ownershipReferee == penalty.referee) || (penaltyButtonStatus.ownershipJudge == penalty.judge){
                    // if the ownership is shared between Referee and Judge and only one was selected
                    score += 5
                    print("[nextQuestion] Partial answer")
                }
                print("[nextQuestion] Score updated to: \(score)")
                
            } else {
                // if the penalty is wrong
                print("[nextQuestion] Wrong answer")
            }
            //log user answer
            logUserAnswer (userAnswerScore: score)
//                        print ( "[nextQuestion] Logged the User Answer in currentQuizz.answers: \(currentQuizz)")
            //            print("[nextQuestion] Question Status before count - currentQuestion: \(currentQuestion) / questionNumber(questionList.count): \(questionList.count) - penatlyNumber (questionList[currentQuestion]): \(questionList[currentQuestion])")
            if !lastQuestion{
                // if the are still questions to answer
                print("Jumpt to the Next Question")
                currentQuestion += 1
//                print("[nextQuestion] Question Status after count - currentQuestion: \(currentQuestion)")
//                print (" [nextQuestion] currentQuizz: \(currentQuizz)")
//                print (" [nextQuestion] quizzHistory: \(quizzHistory)")
                buttonStatusReset()
                
            } else {
                // if this was the last question
                print("End of Quizz - switch to Result Page")
            }
        } // end else user has answered items
    } // NextQuestion
}

struct QuizzQuestionView_Previews: PreviewProvider {
    @State static var shouldGoToRoot = false
    static var previews: some View {
        QuizzQuestionView (shouldPopToRootView: $shouldGoToRoot, questionList: newList(of: 5), penaltyButtonStatus: penaltyButtonStatus)
            .environment(\.locale, .init(identifier: "en"))
    }
}
