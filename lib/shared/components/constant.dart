import 'package:flutter/material.dart';

List<Map> tasks = [];
String? token;
bool? onBoarding;
bool? start;

BouncingScrollPhysics? physics = const BouncingScrollPhysics();

// List<CategeoryItemsModel> CategeoryItemsList = [
//   CategeoryItemsModel(
//       "assets/images/products/iphone.png", () {}, "iPhone XS", " 50,30"),
//   CategeoryItemsModel("assets/images/products/mouselogitech.png", () {},
//       "Mouse logitech", " 50,30"),
//   CategeoryItemsModel(
//       "assets/images/products/smartWatch.png", () {}, "Smart Watch ", " 50,30"),
// ];

//Egypt

//News
//https://newsapi.org/v2/top-headlines?country=eg&apiKey=65f7f556ec76449fa7dc7c0069f040ca

//Get

// base url: https://newsapi.org/
// methode(url): v2/top-headlines?
// queries: country=eg&category=business&apiKey=65f7f556ec76449fa7dc7c0069f040ca

//Science
//https://newsapi.org/v2/top-headlines?country=eg&category=science&apiKey=65f7f556ec76449fa7dc7c0069f040ca

//Get

// base url: https://newsapi.org/
// methode(url): v2/top-headlines?
// queries: country=eg&category=science&apiKey=65f7f556ec76449fa7dc7c0069f040ca

//Business
//https://newsapi.org/v2/top-headlines?country=eg&category=science&apiKey=65f7f556ec76449fa7dc7c0069f040ca

//Get

// base url: https://newsapi.org/
// methode(url): v2/top-headlines?
// queries: country=eg&category=Business&apiKey=65f7f556ec76449fa7dc7c0069f040ca

//Sports
//https://newsapi.org/v2/top-headlines?country=eg&category=science&apiKey=65f7f556ec76449fa7dc7c0069f040ca

//Get

// base url: https://newsapi.org/
// methode(url): v2/top-headlines?
// queries: country=eg&category=Sports&apiKey=65f7f556ec76449fa7dc7c0069f040ca

//https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=ee564a6a28654d1f967de3e14d78921f
//Get Business

// base url: https://newsapi.org/
// methode(url): v2/top-headlines?
// queries: country=us&category=business&apiKey=ee564a6a28654d1f967de3e14d78921f

//https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=ee564a6a28654d1f967de3e14d78921f
// https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=ee564a6a28654d1f967de3e14d78921f
// base url: https://newsapi.org/
// methode(url): v2/top-headlines?
// queries: sources=techcrunch&apiKey=ee564a6a28654d1f967de3e14d78921f

//

//https://newsapi.org/
// v2/everything?
// q=tesla&from=2022-04-06&sortBy=publishedAt&apiKey=ee564a6a28654d1f967de3e14d78921f
