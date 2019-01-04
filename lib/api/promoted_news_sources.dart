import 'package:vinegar/models/models.dart';

var hackerNews = NewsSource(
    newsHandler: NewsHandler.ATOM,
    feedUrl: "http://hackernews.cc/feed",
    iconUrl:
        "https://storage.googleapis.com/site-assets/WStllB9fngOpfMF4xiblEEEZshQAd_6LlkFzA-wFTb4_svisual-165241e3fbc",
    isObserved: false,
    title: "HackerNews",
    websiteUrl: "http://hackernews.cc");

var guardianUS = NewsSource(
    newsHandler: NewsHandler.RSS,
    feedUrl: "https://www.theguardian.com/us-news/rss",
    iconUrl:
        "https://storage.googleapis.com/site-assets/90e4KmOTThFk07stLlf8yoiayCmDG3KGOCdHskFTQG4_visual-167084b1c66",
    isObserved: false,
    title: "US news | The Guardian",
    websiteUrl: "https://www.theguardian.com/");

var bbc = NewsSource(
    newsHandler: NewsHandler.RSS,
    feedUrl:
        "http://newsrss.bbc.co.uk/rss/newsonline_world_edition/front_page/rss.xml",
    iconUrl:
        "https://storage.googleapis.com/site-assets/uYunhGc6mnMcwnCnr6rDEvRhdZsfgW3FK1p4gMSHkiM_visual-163b563c5b3",
    isObserved: false,
    title: "Reddit news",
    websiteUrl: "https://bbc.co.uk");

var redditNews = NewsSource(
    newsHandler: NewsHandler.REDDIT,
    feedUrl: "/r/news",
    iconUrl:
        "https://storage.googleapis.com/site-assets/uYunhGc6mnMcwnCnr6rDEvRhdZsfgW3FK1p4gMSHkiM_visual-163b563c5b3",
    isObserved: false,
    title: "/r/news",
    websiteUrl: "https://bbc.co.uk");
