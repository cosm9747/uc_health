import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFFa6093d);

//Secondary Colors
const kRed = Color(0xFFd6001c);
const kMedGray = Color(0xFF768692); //secondary color
const kDarkGray = Color(0xFF425563); //app bar arrows
const kLightGray = Color(0xFFa4bcc2);

//Tertiary Colors
const kOrange = Color(0xFFfe5000);
const kLightGreen = Color(0xFFbbfb11);
const kLightOrange = Color(0xFFffa300);
const kGreen = Color(0xcc5ece3b);
const kYellow = Color(0xFFffe822);

//Other Colors
const kWhite = Colors.white;
const kBlack = Colors.black;
const kTransparent = Colors.transparent;
const kDisabledMedGray = Color(0x77768692);

const kImages = [
  'images/books.png',
  'images/movies.png',
  'images/magazines.png',
  'images/games.png',
  'images/visitation.png',
  'images/destress.png',
];

const Map<String, List<String>> kRequests = {
  'Books': [
    'Comedy',
    'History',
    'Mystery',
    'Nonfiction',
    'Classics',
  ],
  'Movies': [
    'Comedy',
    'Romantic Comedy',
    'Mystery/Thriller',
    'Action',
    'Drama',
  ],
  'Magazines': [
    'Political',
    'Entertainment',
    'Lifestyle/Health',
  ],
  'Games': [
    'Cards',
    'Board Games',
  ],
  'Visitation': [],
  'Destress': [
    'Journal',
    'Adult Coloring',
    'Crossword Puzzle',
    'Sudoku',
  ]
};

const kHospitals = [
  'University of Colorado - Anschutz',
  'Highlands Ranch',
  'Broomfield',
  'Longs Peak',
  'Greeley',
  'Medical Center of the Rockies',
  'Memorial Hospital North',
  'Pikes Peak Regional',
  'Poudre Valley',
  'Grandview',
  'Memorial Hospital Central',
  'Yampa Valley Medical Center'
];
