//
//  QuizzResultAnswerView.swift
//  Diving Rules
//
//  Created by Benoit SUZANNE on 29/06/2021.
//

import SwiftUI

extension View {
    // an extention of the view model to be able to apply a View Modifier only if a certain condition is met
    // source from Jan Code at https://blog.kaltoun.cz/conditionally-applying-view-modifiers-in-swiftui/
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, content: (Self) -> Content) -> some View {
        if condition {
            content(self)
        }
        else {
            self
        }
    }
}


struct QuizzResultAnswerView: View {
    var quizzResponse: Penalty
//    let testBool = true
    
    var body: some View {
//        let quizzQuestion: Penalty = penalties [quizzResponse.id]
        let quizzRightValue: ButtonsStatus = buttonStatusSet (fromPenalty: quizzResponse.id)
        ScrollView {
            VStack(alignment: .leading) {
                //Rule Description
                Group {
                    VStack (alignment: .leading) {
                        Text("Penalty-Rule")
                            .font(.title)
                            .foregroundColor(Color.accentColor)
                            .padding(.bottom, 1.0)

                        Text("Penalty-Description")
                            .font(.title2)
                            .foregroundColor(Color.accentColor)
                            .padding(.bottom)

                        // Using tranlated penalty desciprion
                        let penaltyDescription = "Penalty-" + String(quizzResponse.id)
                        Text(LocalizedStringKey( penaltyDescription))

                    } // VStack Penalty description
                    HStack {
                        Spacer()
                        //Penalty Reference
                        Text (rulesRelatedList (penaltyItem: quizzResponse))
                            .font(.caption)
                            .fontWeight(.ultraLight)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.trailing)
                    } // HStack Penalty Reference
                } // Group Rule Description
                Spacer()
                Divider ()
                Group {
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
                            PenaltyViewButton(buttonImage: "0.circle", buttonText: NSLocalizedString("Button-0pts", comment: "Button Description"), isOn: (quizzResponse.sanctionValue == 0))
                                .disabled(true)
                            // Is this the right answer - conditional formating
                                .if(quizzRightValue.penaltyZeroPts){ view in
                                    view.overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color.green, lineWidth: 4)
                                    )
                                }// if right/wrong answer
                            Spacer ()
                            // Max 2 pts
                            PenaltyViewButton(buttonImage: "lessthan.circle.fill", buttonText: NSLocalizedString("Button-max2pts", comment: "Button Description"), isOn: (quizzResponse.sanctionValue == 2))
                                .disabled(true)
                                // Is this the right answer - conditional formating
                                    .if(quizzRightValue.penaltyMaxTwoPts){ view in
                                        view.overlay(
                                            RoundedRectangle(cornerRadius: 16)
                                                .stroke(Color.green, lineWidth: 4)
                                        )
                                    }// if right/wrong answer

                            Spacer ()
                            // Max 4 1/2 pts
                            PenaltyViewButton(buttonImage: "lessthan.circle", buttonText: NSLocalizedString("Button-max4halfpts", comment: "Button Description"), isOn: (quizzResponse.sanctionValue == 3))
                                .disabled(true)
                                // Is this the right answer - conditional formating
                                    .if(quizzRightValue.penaltyMaxFourHalfPts){ view in
                                        view.overlay(
                                            RoundedRectangle(cornerRadius: 16)
                                                .stroke(Color.green, lineWidth: 4)
                                        )
                                    }// if right/wrong answer

                            Spacer ()
                        } // HStack Penalty Line 1
                        HStack{
                            //Penalty Line 2
                            Group {
                                Spacer ()
                                // -2 pts
                                PenaltyViewButton(buttonImage: "gobackward.minus", buttonText: NSLocalizedString("Button--2pts", comment: "Button Description"), isOn: (quizzResponse.sanctionValue == 1))
                                    .disabled(true)
                                    // Is this the right answer - conditional formating
                                        .if(quizzRightValue.penaltyMinusTwoPts){ view in
                                            view.overlay(
                                                RoundedRectangle(cornerRadius: 16)
                                                    .stroke(Color.green, lineWidth: 4)
                                            )
                                        }// if right/wrong answer

                                Spacer ()
                                // -1/2 to 2 pts
                                PenaltyViewButton(buttonImage: "arrow.left.and.right.circle", buttonText: NSLocalizedString("Button--halfto2pts", comment: "Button Description"), isOn: (quizzResponse.sanctionValue == 4))
                                    .disabled(true)
                                    // Is this the right answer - conditional formating
                                        .if(quizzRightValue.penaltyMinusHalfToTwoPts){ view in
                                            view.overlay(
                                                RoundedRectangle(cornerRadius: 16)
                                                    .stroke(Color.green, lineWidth: 4)
                                            )
                                        }// if right/wrong answer

                                Spacer ()
                                // judge Opinion
                                PenaltyViewButton(buttonImage: "plusminus.circle", buttonText: NSLocalizedString("Button-judgeOpinion", comment: "Button Description"), isOn: (quizzResponse.sanctionValue == 5))
                                    .disabled(true)
                                    // Is this the right answer - conditional formating
                                        .if(quizzRightValue.penaltyJudgeOpinion){ view in
                                            view.overlay(
                                                RoundedRectangle(cornerRadius: 16)
                                                    .stroke(Color.green, lineWidth: 4)
                                            )
                                        }// if right/wrong answer

                                Spacer ()
                            } // Group Penalty Line 2
                        } // HStack Penalty Line 2
                    } // VStack Penalty Buttons
                } // Penalty Group

                Divider ()
                // Ownership : who is can take the sanction
                Text("Penalty-Ownership")
                    .font(.title2)
                    .foregroundColor(Color.accentColor)
                    .multilineTextAlignment(.leading)
                    .padding(.bottom)

                VStack {
                    HStack {
                        Group {
                        // Ownership Referee
                        OwnerViewButton(buttonImage: "person.fill.and.arrow.left.and.arrow.right", imageWidth: 60.0, imageHeigth: 40.0, buttonText: NSLocalizedString("Button-Referee", comment: "Button Description"), isOn: quizzResponse.referee)
                            .padding(.horizontal, 20.0)
                            .padding(.vertical, 5.0)
                            .disabled(true)
                            // Is this the right answer - conditional formating
                            .if(quizzRightValue.ownershipReferee){ view in
                                    view.overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color.green, lineWidth: 4)
                                    )
                                }// if right/wrong answer

                        Spacer ()
                        // Ownership Judge
                        OwnerViewButton(buttonImage: "person.3.fill", imageWidth: 85.0, imageHeigth: 40.0, buttonText: NSLocalizedString("Button-Judge", comment: "Button Description"), isOn: quizzResponse.judge)
                            .padding(.horizontal, 15.0)
                            .padding(.vertical, 5.0)
                            .disabled(true)
                            // Is this the right answer - conditional formating
                                .if(quizzRightValue.ownershipJudge){ view in
                                    view.overlay(
                                        RoundedRectangle(cornerRadius: 16)
                                            .stroke(Color.green, lineWidth: 4)
                                    )
                                }// if right/wrong answer
                        } // Ownership Group
                    }  // HStack Ownership
                    .padding(.horizontal, 30.0)
                    .padding(.bottom)
                } // VStack Ownership
                .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Group {
                    Spacer()
                    Spacer()
                    Divider ()
                    Spacer ()
                    // Legend
                    HStack {
                        Text("Quizz-Result-Legend-unused")
                            .fontWeight(.light)
                            .foregroundColor(Color.gray)
                            .font(.footnote)
                        Spacer ()
                        Text("Quizz-Result-Legend-user-answer")
                            .foregroundColor(Color("AccentColor"))
                            .font(.footnote)
                        Spacer ()
                        Text("Quizz-Result-Legend-real-answer")
                            .font(.footnote)
                            .padding(6.0)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.green, lineWidth: 4)
                            )
                    } // HStack Legend
                } // Legend Group
                Spacer ()
            } // VStack Top
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        } //ScrollView
        
    } // Body}
}

struct QuizzResultAnswerView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            QuizzResultAnswerView(quizzResponse:  penalties [0])
                .environment(\.locale, .init(identifier: "en"))
            QuizzResultAnswerView(quizzResponse:  penalties [0])
                .environment(\.locale, .init(identifier: "fr"))
        } // Group
    } // View
} // Struct

