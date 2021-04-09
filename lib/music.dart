import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_app/components/custom_list_tile.dart';

class Music extends StatefulWidget {
  @override
  _MusicState createState() => _MusicState();
}

class _MusicState extends State<Music> {

  List musicList = [
    {
      'title': "Tech House Vibes",
      'singer': "Alenjandro Magino",
      'url': "https://assets.mixkit.co/music/preview/mixkit-tech-house-vibes-130.mp3",
      'coverUrl': "https://picsum.photos/200"
    },
    {
      'title': "Tech House Vibes",
      'singer': "Alenjandro Magino",
      'url': "https://assets.mixkit.co/music/preview/mixkit-tech-house-vibes-130.mp3",
      'coverUrl': "https://picsum.photos/200"
    },
    {
      'title': "Tech House Vibes",
      'singer': "Alenjandro Magino",
      'url': "https://assets.mixkit.co/music/preview/mixkit-tech-house-vibes-130.mp3",
      'coverUrl': "https://picsum.photos/200"
    },
    {
      'title': "Tech House Vibes",
      'singer': "Alenjandro Magino",
      'url': "https://assets.mixkit.co/music/preview/mixkit-tech-house-vibes-130.mp3",
      'coverUrl': "https://picsum.photos/200"
    },
    {
      'title': "Tech House Vibes",
      'singer': "Alenjandro Magino",
      'url': "https://assets.mixkit.co/music/preview/mixkit-tech-house-vibes-130.mp3",
      'coverUrl': "https://picsum.photos/200"
    },
    {
      'title': "Tech House Vibes",
      'singer': "Alenjandro Magino",
      'url': "https://assets.mixkit.co/music/preview/mixkit-tech-house-vibes-130.mp3",
      'coverUrl': "https://picsum.photos/200"
    },
  ];

  String currentTitle="";
  String currentCover="";
  String currentSinger="";
  IconButton btnIcon = Icons.play_arrow as IconButton;

  AudioPlayer audioPlayer = new AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  bool isPlaying = false;
  String currentSong = "";

  Duration duration = new Duration();
  Duration position = new Duration();



  void playMusic(String url)async{
      if(isPlaying && currentSong != url){
        audioPlayer.pause();
        int result = await audioPlayer.play(url);
        if(result==1){
          setState(() {
            currentSong = url;
          });
        }
      } else if(!isPlaying){
        int result = await audioPlayer.play(url);
        if(result==1) {
          setState(() {
            isPlaying = true;
          });
        }
      }
  }




  @override
  Widget build(BuildContext context) {
    const PrimaryColor = const Color(0xff7b1fa2);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('My Playlist', style: TextStyle(color: Colors.black)),
        elevation: 0,
      ),
      body : Column(
        children: [

          Expanded(child: ListView.builder(
              itemCount: musicList.length,
              itemBuilder: (context, index) =>customListTile(
                onTap: (){
                  playMusic(musicList[index]['url']);
                  setState(() {
                    currentTitle = musicList[index]['title'];
                    currentCover = musicList[index]['coverUrl'];
                    currentSinger = musicList[index]['singer'];
                  });
                },
            title: musicList[index]['title'],
            singer: musicList[index]['singer'],
            cover: musicList[index]['coverUrl'],
          )),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Color(0x55212121),blurRadius: 5.0)
              ]
            ),
            child: Column(
              children: [
                Slider.adaptive(value: 0.0, onChanged: (value){}),

                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0,left: 12.0,right: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 55.0,
                        width: 55.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(6.0),
                            image: DecorationImage(
                                image: NetworkImage(currentCover)
                            )
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(currentTitle,style: TextStyle(
                              fontSize: 15.0,fontWeight: FontWeight.w600,
                            )),
                            SizedBox(height: 5.0),
                            Text(currentSinger,style: TextStyle(
                                fontSize: 13.0,color: Colors.grey
                            )),
                          ],
                        ),
                      ),
                      IconButton(
                        iconSize: 42.0,
                          icon: Icon(Icons.play_arrow), onPressed: () {
                          if(isPlaying){
                            audioPlayer.pause();
                            setState(() {
                              btnIcon = Icons.pause as IconButton;
                              isPlaying = false;
                            });
                          }else{
                            audioPlayer.resume();
                            setState(() {
                              btnIcon = Icons.play_arrow as IconButton;
                              isPlaying = true;
                            });
                          }
                      },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

}

