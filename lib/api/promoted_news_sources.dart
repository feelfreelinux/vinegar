import 'package:vinegar/models/models.dart';

var hackerNews = NewsSource(
    feedUrl: "http://hackernews.cc/feed",
    iconUrl:
        "https://storage.googleapis.com/site-assets/WStllB9fngOpfMF4xiblEEEZshQAd_6LlkFzA-wFTb4_svisual-165241e3fbc",
    isObserved: false,
    name: "atom",
    title: "HackerNews",
    websiteUrl: "http://hackernews.cc");

var guardianUS = NewsSource(
    feedUrl: "https://www.theguardian.com/us-news/rss",
    iconUrl:
        "https://storage.googleapis.com/site-assets/90e4KmOTThFk07stLlf8yoiayCmDG3KGOCdHskFTQG4_visual-167084b1c66",
    isObserved: false,
    name: "rss",
    title: "US news | The Guardian",
    websiteUrl: "https://www.theguardian.com/");

var bbc = NewsSource(
    feedUrl: "http://newsrss.bbc.co.uk/rss/newsonline_world_edition/front_page/rss.xml",
    iconUrl:
        "https://storage.googleapis.com/site-assets/uYunhGc6mnMcwnCnr6rDEvRhdZsfgW3FK1p4gMSHkiM_visual-163b563c5b3",
    isObserved: false,
    name: "rss",
    title: "BBC",
    websiteUrl: "https://bbc.co.uk");

