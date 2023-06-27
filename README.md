# tapped_interview_test
A little Test project for an interview


I have plans to later implement Riverpod and do some visual and performance improvements.



## Introduction

In this project, you will find designs from our app [Storyways](https://storyways.app). You can fork this repository, or create a new public repository on [GitHub](https://github.com/) or [GitLab](https://gitlab.com/) where you implement the screens shown in the designs.
To ensure that there is a strong linter, you should use the strong linter [tapped_lints](https://github.com/tappeddev/tapped_lints) that is available on GitHub. The readme of tapped_lints describes how to use the package.  

## Task

The design shows a list of books with a search bar at the top. When you start searching the overlay expands and shows the results. The list of the "continue" and the "New" section are mocked for now on. 
Covers need to be fetched by [picsum](https://picsum.photos/) for finding example photos for book covers.
The search is currently implemented by [university-domains-list](https://github.com/Hipo/university-domains-list) for searching "Book names". 
⚠️ We are working on a Google could function that could handle the search in the future. 

Following features should be included:
- [x] Setup and use [FVM](https://fvm.app/)
- [x] [tapped_lints](https://github.com/tappeddev/tapped_lints) is included 
- [x] Create a list with a few book items that can be used for the different sections and the search
- [x] "Continue" and "New" sections are in one list that is scrollable vertically
- [x] "Continue" section can scroll horizontally
- [x] The `ListView` should build items lazy by using `ListView.builder`
- [x] Items should have touch feedback, but no navigation
- [x] When the search results appear, the overlay expands and reveals the items
- [x] When the user taps outside of the overlay, the overlay closes
- [x] The search should start automatically after 350 milliseconds, whenever the user stops adding new characters into the text field. 
- [x] Whenever the search doesn't contain any result an empty state info will be displayed
- [x] When the user clears the text, the overlay closes as well
- [x] Bottom navigation bar does nothing on tap (only visuals)
- [x] Light & Dark theme is possible and switch automatically when changing the device theme
