import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  // each response depends on each other
//  void getData() async{


// Two////////////////////////////////////////
    /**
     *  the response time is given to us by the
     *  http module
      */
//    Response response = await
//    get('https://jsonplaceholder.typicode.com/todos/1');

    /**
     *  this is not a map but a string when we
        were using the print statement now that
        we imported and are using the jsonDecoder
        we can now make it a map
     */

//    Map data = jsonDecode(response.body);
//    print(data);
    // now we can access parts of the data like a map
//    print(data['title']);
////////////////////////////////////

//One////////////////////////////////

    /**
     * simulate network request for a username
        asynchronous request the await basically
        wait until this function finish running
     */

//    String greetings =
//    await Future.delayed(Duration(seconds: 3), (){
//      return 'Hello';
//    });

    // simulate network request to get response o
//    String response =
//    await Future.delayed(Duration(seconds: 2), (){
//      return 'But Im drunk what do you expect';
//    });

//    // print('$greetings ,you say hello so slow, $response ');
//    print(',you say hello so slow, ');
//    print('$greetings' ); // we had to wait for greetings and response
//    print('$response ');
////////////////////////////////////////////////

//  }


//  void getTime() async was here before
  void setupWorldTime() async{

    WorldTime instance = WorldTime(location: 'New York', flag: 'United_States.png', url: 'America/New_York');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
         'location': instance.location,
         'flag': instance.flag,
         'time': instance.time,
         'isDaytime': instance.isDaytime
       });
}
  @override
  void initState() {
    /**
     * async will be used in the future to get time and information for api and etc ...
     */
    super.initState();
    setupWorldTime();
    // getTime(); // get time was here before setupWorldTime
//    getData();
//    print('we are printing after and outside of the' +
//        'getData method which contains async functions and methods' +
//        ' so we are outside its scope and we wont wait to tell you this');
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

     backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        ),
      ),



        );

  }
}
