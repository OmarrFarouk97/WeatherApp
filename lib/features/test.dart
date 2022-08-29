import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  // bool _pinned = true;
  // bool _snap = false;
  // bool _floating = false;

// [SliverAppBar]s are typically used in [CustomScrollView.slivers], which in
// turn can be placed in a [Scaffold.body].
  @override
  Widget build(BuildContext context) {
    return Scaffold(

     // backgroundColor: Colors.black12,

      body: CustomScrollView(
        scrollBehavior:  ScrollBehavior(),
        slivers: <Widget>[
          SliverAppBar(



            pinned: true,
            stretch: true,
            snap: false,
            floating: false,
            expandedHeight: 300.0,
            flexibleSpace:  FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(left:130,top: 70 ),


              title:  Text('SliverAppBar',style: TextStyle(color: Colors.black87  ),),


              // Padding(
              //   padding: EdgeInsets.only(top: 180,right: 40),
              //   child: Center(child: Column(
              //     children: [
              //       // Image(image: AssetImage('assets/images/cloudy.png',),height: 120,width: 120,),
              //       SizedBox(
              //         height: 20,
              //       ),
              //
              //       Text('SliverAppBar',style: TextStyle(color: Colors.white),),
              //
              //     ],
              //   )),
              // ),
              background:
                Container(height: 20,
                    width: 100,
                    child: Image(image: AssetImage('assets/images/cloudy.png',),fit: BoxFit.fill ,)),


              // Padding(
              //
              //   padding: EdgeInsets.all(0.0),
              //   child:
              //   Image(image: AssetImage('assets/images/StockSnap_CO08LAFBTH.jpg',)),
              // ),
            ),
          ),
           SliverToBoxAdapter(


            child: Container(
              color: Colors.black,
              child: SizedBox(

                height: 20,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text('In 7 Days.',style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold,fontSize: 20),),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 100.0,
                  child: Center(
                    child: Text('$index', textScaleFactor: 5),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}

