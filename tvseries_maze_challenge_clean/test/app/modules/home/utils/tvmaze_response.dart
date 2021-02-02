const tvMazeResult = """
[{
    "id": 1,
    "url": "http://www.tvmaze.com/shows/1/under-the-dome",
    "name": "Under the Dome",
    "type": "Scripted",
    "language": "English",
    "genres": [
        "Drama",
        "Science-Fiction",
        "Thriller"
    ],
    "status": "Ended",
    "runtime": 60,
    "premiered": "2013-06-24",
    "officialSite": "http://www.cbs.com/shows/under-the-dome/",
    "schedule": {
        "time": "22:00",
        "days": [
            "Thursday"
        ]
    },
    "rating": {
        "average": 6.5
    },
    "weight": 97,
    "network": {
        "id": 2,
        "name": "CBS",
        "country": {
            "name": "United States",
            "code": "US",
            "timezone": "America/New_York"
        }
    },
    "webChannel": null,
    "externals": {
        "tvrage": 25988,
        "thetvdb": 264492,
        "imdb": "tt1553656"
    },
    "image": {
        "medium": "http://static.tvmaze.com/uploads/images/medium_portrait/81/202627.jpg",
        "original": "http://static.tvmaze.com/uploads/images/original_untouched/81/202627.jpg"
    },
    "summary": "<p><b>Under the Dome</b> is the story of a small town that is suddenly and inexplicably sealed off from the rest of the world by an enormous transparent dome. The town's inhabitants must deal with surviving the post-apocalyptic conditions while searching for answers about the dome, where it came from and if and when it will go away.</p>",
    "updated": 1573667713,
    "_links": {
        "self": {
            "href": "http://api.tvmaze.com/shows/1"
        },
        "previousepisode": {
            "href": "http://api.tvmaze.com/episodes/185054"
        }
    }
},
{
    "id": 2,
    "url": "http://www.tvmaze.com/shows/2/person-of-interest",
    "name": "Person of Interest",
    "type": "Scripted",
    "language": "English",
    "genres": [
        "Action",
        "Crime",
        "Science-Fiction"
    ],
    "status": "Ended",
    "runtime": 60,
    "premiered": "2011-09-22",
    "officialSite": "http://www.cbs.com/shows/person_of_interest/",
    "schedule": {
        "time": "22:00",
        "days": [
            "Tuesday"
        ]
    },
    "rating": {
        "average": 8.9
    },
    "weight": 95,
    "network": {
        "id": 2,
        "name": "CBS",
        "country": {
            "name": "United States",
            "code": "US",
            "timezone": "America/New_York"
        }
    },
    "webChannel": null,
    "externals": {
        "tvrage": 28376,
        "thetvdb": 248742,
        "imdb": "tt1839578"
    },
    "image": {
        "medium": "http://static.tvmaze.com/uploads/images/medium_portrait/163/407679.jpg",
        "original": "http://static.tvmaze.com/uploads/images/original_untouched/163/407679.jpg"
    },
    "summary": "<p>You are being watched. The government has a secret system, a machine that spies on you every hour of every day. I know because I built it. I designed the Machine to detect acts of terror but it sees everything. Violent crimes involving ordinary people. People like you. Crimes the government considered irrelevant. They wouldn't act so I decided I would. But I needed a partner. Someone with the skills to intervene. Hunted by the authorities, we work in secret. You'll never find us. But victim or perpetrator, if your number is up, we'll find you.</p>",
    "updated": 1588773151,
    "_links": {
        "self": {
            "href": "http://api.tvmaze.com/shows/2"
        },
        "previousepisode": {
            "href": "http://api.tvmaze.com/episodes/659372"
        }
    }
}]
""";

const tvMazeResultSearchByName = """
[{
    "id": 1,
    "url": "http://www.tvmaze.com/shows/1/under-the-dome",
    "name": "Under the Dome",
    "type": "Scripted",
    "language": "English",
    "genres": [
        "Drama",
        "Science-Fiction",
        "Thriller"
    ],
    "status": "Ended",
    "runtime": 60,
    "premiered": "2013-06-24",
    "officialSite": "http://www.cbs.com/shows/under-the-dome/",
    "schedule": {
        "time": "22:00",
        "days": [
            "Thursday"
        ]
    },
    "rating": {
        "average": 6.5
    },
    "weight": 97,
    "network": {
        "id": 2,
        "name": "CBS",
        "country": {
            "name": "United States",
            "code": "US",
            "timezone": "America/New_York"
        }
    },
    "webChannel": null,
    "externals": {
        "tvrage": 25988,
        "thetvdb": 264492,
        "imdb": "tt1553656"
    },
    "image": {
        "medium": "http://static.tvmaze.com/uploads/images/medium_portrait/81/202627.jpg",
        "original": "http://static.tvmaze.com/uploads/images/original_untouched/81/202627.jpg"
    },
    "summary": "<p><b>Under the Dome</b> is the story of a small town that is suddenly and inexplicably sealed off from the rest of the world by an enormous transparent dome. The town's inhabitants must deal with surviving the post-apocalyptic conditions while searching for answers about the dome, where it came from and if and when it will go away.</p>",
    "updated": 1573667713,
    "_links": {
        "self": {
            "href": "http://api.tvmaze.com/shows/1"
        },
        "previousepisode": {
            "href": "http://api.tvmaze.com/episodes/185054"
        }
    }
}]
""";

const tvMazeResultSearchByNameWithEpisodes = """
{
    "id": 1,
    "url": "http://www.tvmaze.com/shows/1/under-the-dome",
    "name": "Under the Dome",
    "type": "Scripted",
    "language": "English",
    "genres": [
        "Drama",
        "Science-Fiction",
        "Thriller"
    ],
    "status": "Ended",
    "runtime": 60,
    "premiered": "2013-06-24",
    "officialSite": "http://www.cbs.com/shows/under-the-dome/",
    "schedule": {
        "time": "22:00",
        "days": [
            "Thursday"
        ]
    },
    "rating": {
        "average": 6.5
    },
    "weight": 97,
    "network": {
        "id": 2,
        "name": "CBS",
        "country": {
            "name": "United States",
            "code": "US",
            "timezone": "America/New_York"
        }
    },
    "webChannel": null,
    "externals": {
        "tvrage": 25988,
        "thetvdb": 264492,
        "imdb": "tt1553656"
    },
    "image": {
        "medium": "http://static.tvmaze.com/uploads/images/medium_portrait/81/202627.jpg",
        "original": "http://static.tvmaze.com/uploads/images/original_untouched/81/202627.jpg"
    },
    "summary": "<p><b>Under the Dome</b> is the story of a small town that is suddenly and inexplicably sealed off from the rest of the world by an enormous transparent dome. The town's inhabitants must deal with surviving the post-apocalyptic conditions while searching for answers about the dome, where it came from and if and when it will go away.</p>",
    "updated": 1573667713,
    "_links": {
        "self": {
            "href": "http://api.tvmaze.com/shows/1"
        },
        "previousepisode": {
            "href": "http://api.tvmaze.com/episodes/185054"
        }
    },
    "_embedded": {
        "episodes": [
            {
                "id": 1,
                "url": "http://www.tvmaze.com/episodes/1/under-the-dome-1x01-pilot",
                "name": "Pilot",
                "season": 1,
                "number": 1,
                "type": "regular",
                "airdate": "2013-06-24",
                "airtime": "22:00",
                "airstamp": "2013-06-25T02:00:00+00:00",
                "runtime": 60,
                "image": {
                    "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/1/4388.jpg",
                    "original": "http://static.tvmaze.com/uploads/images/original_untouched/1/4388.jpg"
                },
                "summary": "<p>When the residents of Chester's Mill find themselves trapped under a massive transparent dome with no way out, they struggle to survive as resources rapidly dwindle and panic quickly escalates.</p>",
                "_links": {
                    "self": {
                        "href": "http://api.tvmaze.com/episodes/1"
                    }
                }
            },
            {
                "id": 2,
                "url": "http://www.tvmaze.com/episodes/2/under-the-dome-1x02-the-fire",
                "name": "The Fire",
                "season": 1,
                "number": 2,
                "type": "regular",
                "airdate": "2013-07-01",
                "airtime": "22:00",
                "airstamp": "2013-07-02T02:00:00+00:00",
                "runtime": 60,
                "image": {
                    "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/1/4389.jpg",
                    "original": "http://static.tvmaze.com/uploads/images/original_untouched/1/4389.jpg"
                },
                "summary": "<p>While the residents of Chester's Mill face the uncertainty of life in the dome, panic is heightened when a house goes up in flames and their fire department is outside of the dome.</p>",
                "_links": {
                    "self": {
                        "href": "http://api.tvmaze.com/episodes/2"
                    }
                }
            }
        ]
    }
}
""";

var tvMazeResultFetchEpisodeByParams = """
{
    "id": 1,
    "url": "http://www.tvmaze.com/episodes/1/under-the-dome-1x01-pilot",
    "name": "Pilot",
    "season": 1,
    "number": 1,
    "type": "regular",
    "airdate": "2013-06-24",
    "airtime": "22:00",
    "airstamp": "2013-06-25T02:00:00+00:00",
    "runtime": 60,
    "image": {
        "medium": "http://static.tvmaze.com/uploads/images/medium_landscape/1/4388.jpg",
        "original": "http://static.tvmaze.com/uploads/images/original_untouched/1/4388.jpg"
    },
    "summary": "<p>When the residents of Chester's Mill find themselves trapped under a massive transparent dome with no way out, they struggle to survive as resources rapidly dwindle and panic quickly escalates.</p>",
    "_links": {
        "self": {
            "href": "http://api.tvmaze.com/episodes/1"
        }
    }
}
""";