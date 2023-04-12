import 'package:get/get.dart';

var listOfCountry = [
  {"name": "INDIA", "code": "in"},
  {"name": "USA", "code": "us"},
  {"name": "MEXICO", "code": "mx"},
  {"name": "United Arab Emirates", "code": "ae"},
  {"name": "New Zealand", "code": "nz"},
  {"name": "Israel", "code": "il"},
  {"name": "Indonesia", "code": "id"},
  {"name": "Japan", "code": "jp"},
];

RxList listOfCategory = [
  {
    "name": "ALL",
    "code": "",
    "imageUrl":
        "https://media.istockphoto.com/id/1201736751/id/foto/latar-belakang-berita-merah-kreatif.jpg?s=612x612&w=0&k=20&c=ZvgM0lv2LWwlbgwVocP4SHrrxZqu3bq0yaNXOAFwWFQ="
  },
  {
    "name": "science",
    "code": "science",
    "imageUrl":
        "https://images.unsplash.com/photo-1518152006812-edab29b069ac?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80"
  },
  {
    "name": "business",
    "code": "business",
    "imageUrl":
        "https://images.unsplash.com/photo-1639754390580-2e7437267698?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fGJ1c3NpbmVzcyUyMGNoYXJ0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"
  },
  {
    "name": "technology",
    "code": "technology",
    "imageUrl":
        "https://images.unsplash.com/photo-1573804633927-bfcbcd909acd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=927&q=80"
  },
  {
    "name": "sports",
    "code": "sports",
    "imageUrl":
        "https://images.unsplash.com/photo-1517649763962-0c623066013b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHNwb3J0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"
  },
  {
    "name": "health",
    "code": "health",
    "imageUrl":
        "https://images.unsplash.com/photo-1526256262350-7da7584cf5eb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"
  },
  {
    "name": "general",
    "code": "general",
    "imageUrl":
        "https://images.unsplash.com/photo-1480714378408-67cf0d13bc1b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80"
  },
  {
    "name": "entertainment",
    "code": "entertainment",
    "imageUrl":
        "https://images.unsplash.com/photo-1586899028174-e7098604235b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871&q=80"
  },
].obs;
var listOfNewsChannel = [
  {"name": "BBC News", "code": "bbc-news"},
  {"name": "The Times of India", "code": "the-times-of-india"},
  {"code": "politico", "name": "politico"},
  {"code": "the-washington-post", "name": "The Washington Post"},
  {"code": "reuters", "name": "reuters"},
  {"code": "cnn", "name": "cnn"},
  {"code": "nbc-news", "name": "nbc news"},
  {"code": "the-hill", "name": "The Hill"},
  {"code": "fox-news", "name": "Fox News"},
  {"code": "fox-news", "name": "Fox News"},
];
