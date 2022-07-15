# Flutter hooks_riverpod example with S.O.L.I.D principle

A Flutter project to learn riverpod following S.O.L.I.D principles

If you're starting with [hooks_riverpod](https://pub.dev/packages/hooks_riverpod) so this project is a good start point to see how it works, do more with less 😉

In this app we get trending giphys fetching [Giphy API](https://giphy.com)



https://user-images.githubusercontent.com/67912928/179321628-c686a8d5-50a8-455f-a107-e26b9c1ca316.mp4



## Getting Started

To getting start make sure you have installed the Flutter version 3.0.0, we used it in this project.

Once you have the project running you'll need to get a new `api_key` in [Giphy Console](https://developers.giphy.com) a new one and replace on the project `giphy.repository.dart` line `14 -> apiKey variable`


## Packages 

- [http](https://pub.dev/packages/http)

- [hooks_riverpod](https://pub.dev/packages/hooks_riverpod)

## Just to remember you

You can learn more about S.O.L.I.D princples with Dart in this amazing MEDIUM article [solid principles in Dart](https://medium.flutterdevs.com/s-o-l-i-d-principles-in-dart-e6c0c8d1f8f1) 

**Basically the SOLID ideas are**

1 - The single-responsibility principle: "There should never be more than one reason for a class to change." In other words, every class should have only one responsibility.

2 - The open–closed principle: "Software entities ... should be open for extension, but closed for modification."

3 - The Liskov substitution principle: "Functions that use pointers or references to base classes must be able to use objects of derived classes without knowing it."

4 - The interface segregation principle: "Many client-specific interfaces are better than one general-purpose interface."

5 - The dependency inversion principle: "Depend upon abstractions, [not] concretions."
