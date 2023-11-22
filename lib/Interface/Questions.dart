import '../model/question.dart';

List<QuestionModel> question = [
  QuestionModel(question: 'the biggest country is ?', time: 20, answers: [
    AnswerModel(answer: 'Syria', isCorrect: false),
    AnswerModel(answer: 'China', isCorrect: false),
    AnswerModel(answer: 'USA', isCorrect: false),
    AnswerModel(answer: 'Russia', isCorrect: true),
  ]),
  QuestionModel(question: 'The longest tower is ?', time: 20, answers: [
    AnswerModel(answer: 'Biza', isCorrect: false),
    AnswerModel(answer: 'Effel', isCorrect: false),
    AnswerModel(answer: 'Khalifa', isCorrect: true),
    AnswerModel(answer: 'Makka', isCorrect: false),
  ]),
  QuestionModel(question: 'The capital city of UAE is ?', time: 20, answers: [
    AnswerModel(answer: 'Damascus', isCorrect: false),
    AnswerModel(answer: 'Abodhabi', isCorrect: true),
    AnswerModel(answer: 'Dubai', isCorrect: false),
    AnswerModel(answer: 'Shariga', isCorrect: false),
  ]),
  QuestionModel(question: 'How long are you ?', time: 20, answers: [
    AnswerModel(answer: '20', isCorrect: false),
    AnswerModel(answer: '10', isCorrect: false),
    AnswerModel(answer: '3', isCorrect: false),
    AnswerModel(answer: '1.89', isCorrect: true),
  ]),
];
