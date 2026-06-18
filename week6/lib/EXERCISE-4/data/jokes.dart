import '../model/joke_model.dart';

List<Joke> jokes = List.generate(
  20,
  (index) => Joke(
    title: "Joke ${index + 1}",
    description: "This is the funny description for joke number ${index + 1}.",
  ),
);
