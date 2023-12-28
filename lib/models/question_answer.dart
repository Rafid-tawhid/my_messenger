// List<Map<String, dynamic>> questionAnsList = [
//   {
//     'question': '1 .Which one is false?',
//     'answer': ['Abstract method doesn’t have a body.','Abstract classes cannot be instantiated.','A class can have multiple constructors','A class can’t implement another class and can be mixed with another class at the same time'],
//     'rightAns': 'A class can’t implement another class and can be mixed with another class at the same time',
//     'givenAns': '',
//   },
//   {
//     'question': '2. Which of the following is not a built in type in Dart',
//     'answer': ['int','float','bool','Function'],
//     'rightAns': 'float',
//     'givenAns': '',
//   },
//   {
//     'question': '3. Which one of the following declarations is incorrect?',
//     'answer': ['var x = 10','final String name = ‘ABC’','static final var String routeName = ‘/’','dynamic d = false'],
//     'rightAns': 'static final var String routeName = ‘/’',
//     'givenAns': '',
//   },
//   {
//     'question': '4. If you have a class named Student with two properties name and id, which one of the following constructor declarations is invalid?',
//     'answer': ['Student(this.name, this.id)','Student.basic(this.name, this.id)','Student(String name, int id) : super(name, id)','Student([this.name = ‘’, this.id = 0])'],
//     'rightAns': 'Student(String name, int id) : super(name, id)',
//     'givenAns': '',
//   },
//   {
//     'question': '5. Which of the following declarations is incorrect?',
//     'answer': ['final List<int> marks = const[50, 60, 70]','final Set<int> marks = {50, 60, 70}','const marks = const {‘Math’ : 80, ‘Physics’: 85}','const marks = final {‘Math’ : 80, ‘Physics’: 85}'],
//     'rightAns': 'const marks = final {‘Math’ : 80, ‘Physics’: 85}',
//     'givenAns': '',
//   },
//   {
//     'question': '6. The _______ function is a predefined method in Dart',
//     'answer': ['declare()','list()','main()','return()'],
//     'rightAns': 'main()',
//     'givenAns': '',
//   },
//   {
//     'question': '7. if(a != null) print(a) else print(‘null’) - is equivalent to',
//     'answer': ['print(a ? a : ‘null’)','print(a! ? a : ‘null’)','print(a? : ‘null’)','print(a ?? ‘null’)'],
//     'rightAns': 'print(a ?? ‘null’)',
//     'givenAns': '',
//   },
//   {
//     'question': '8. SDK stands for _____',
//     'answer': ['System Dart Kernel','Software Development Kernel','Software Development Kit','Software Design Key'],
//     'rightAns': 'Software Development Kit',
//     'givenAns': '',
//   },
//   {
//     'question': '9. If you want to display a text, which widget would you use?',
//     'answer': ['Text','RichText','TextStyle','TextSpan'],
//     'rightAns': 'Text',
//     'givenAns': '',
//   },
//   {
//     'question': '10. Which of the following is not a layout widget?',
//     'answer': ['SizedBox','Icon','Row','AppBar'],
//     'rightAns': 'Icon',
//     'givenAns': '',
//   },
//   {
//     'question': '11. Choose the correct form of the verb:',
//     'answer': ['She have a new car.', 'She has a new car.', 'She haves a new car.', 'She having a new car.'],
//     'rightAns': 'She has a new car.',
//     'givenAns': '',
//   },
//   {
//     'question': '12. Identify the sentence with correct punctuation:',
//     'answer': [
//       'The movie was boring the actors were not skilled and the plot was confusing.',
//       'The movie was boring, the actors were not skilled and the plot was confusing.',
//       'The movie was boring; the actors were not skilled, and the plot was confusing.',
//       'The movie was boring the actors were not skilled, and the plot was confusing.'
//     ],
//     'rightAns': 'The movie was boring; the actors were not skilled, and the plot was confusing.',
//     'givenAns': '',
//   },
//   {
//     'question': '13. Select the sentence with proper use of the conjunction:',
//     'answer': ['He likes both ice cream he prefers cake.', 'He likes both ice cream, and he prefers cake.', 'He likes both ice cream and prefers cake.', 'He likes both ice cream and, he prefers cake.'],
//     'rightAns': 'He likes both ice cream, and he prefers cake.',
//     'givenAns': '',
//   },
//   {
//     'question': '14. Choose the correctly spelled word:',
//     'answer': ['Embarrasment', 'Embarassment', 'Embarrassment', 'Embarasment'],
//     'rightAns': 'Embarrassment',
//     'givenAns': '',
//   },
//   {
//     'question': '15. Identify the sentence with proper tense usage:',
//     'answer': [
//       'She will finish her work yesterday.',
//       'She finished her work tomorrow.',
//       'She finishes her work yesterday.',
//       'She will finish her work tomorrow.'
//     ],
//     'rightAns': 'She will finish her work tomorrow.',
//     'givenAns': '',
//   },
//   {
//     'question': '16. Choose the correct form of the adjective:',
//     'answer': ['That is a more bigger problem.', 'That is a more big problem.', 'That is a bigger problem.', 'That is a biggers problem.'],
//     'rightAns': 'That is a bigger problem.',
//     'givenAns': '',
//   },
//   {
//     'question': '17. Identify the sentence with correct capitalization:',
//     'answer': ['new york city is in the united states.', 'New York City is in the United States.', 'new York city is in the United states.', 'New york city is in the united states.'],
//     'rightAns': 'New York City is in the United States.',
//     'givenAns': '',
//   },
//   {
//     'question': '18. Choose the correct preposition:',
//     'answer': ['The cat is sitting on the chair.', 'The cat is sitting in the chair.', 'The cat is sitting under the chair.', 'The cat is sitting between the chair.'],
//     'rightAns': 'The cat is sitting on the chair.',
//     'givenAns': '',
//   },
//   {
//     'question': '19. Select the sentence with proper use of quotation marks:',
//     'answer': [
//       'She said, I love programming.',
//       'She said, "I love programming."',
//       'She said I love programming.',
//       'She said "I love programming".'
//     ],
//     'rightAns': 'She said, "I love programming."',
//     'givenAns': '',
//   },
//   {
//     'question': '20. Choose the correct form of the adverb:',
//     'answer': ['He runs more quickly than her.', 'He runs quicker than her.', 'He runs more quick than her.', 'He runs quicklier than her.'],
//     'rightAns': 'He runs more quickly than her.',
//     'givenAns': '',
//   },
// ];