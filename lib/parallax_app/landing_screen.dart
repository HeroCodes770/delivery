

import 'package:flutter/material.dart';



class AnimationsApp extends StatefulWidget {
  const AnimationsApp({ Key? key }) : super(key: key);

  @override
  State<AnimationsApp> createState() => _AnimationsAppState();
}

class _AnimationsAppState extends State<AnimationsApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animations App'),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.35,
        width: MediaQuery.of(context).size.width * 0.65,
        child:  Material(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          child: Card(
            elevation: 4,
            margin:const EdgeInsets.all(10),
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.65,
                  child: Image.network('https://images.pexels.com/photos/7173203/pexels-photo-7173203.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500', fit: BoxFit.cover, filterQuality: FilterQuality.low,),
                  
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}



class CardDetails {
  final String title;
  final String imgUrl;

  CardDetails(this.title, this.imgUrl);
}

final List<CardDetails> cardDeets = [
  CardDetails('We started from here',
      'https://images.pexels.com/photos/11612904/pexels-photo-11612904.jpeg?cs=srgb&dl=pexels-ivan-mudruk-11612904.jpg&fm=jpg'),
  CardDetails('We started from here',
      'https://images.pexels.com/photos/11612904/pexels-photo-11612904.jpeg?cs=srgb&dl=pexels-ivan-mudruk-11612904.jpg&fm=jpg'),
  CardDetails('We started from here',
      'https://images.pexels.com/photos/11612904/pexels-photo-11612904.jpeg?cs=srgb&dl=pexels-ivan-mudruk-11612904.jpg&fm=jpg'),
  CardDetails('We started from here',
      'https://images.pexels.com/photos/11612904/pexels-photo-11612904.jpeg?cs=srgb&dl=pexels-ivan-mudruk-11612904.jpg&fm=jpg')
];
