import 'package:flutter/material.dart';

import 'Utils/util_service.dart';
import 'home_page.dart';


class IntroPage extends StatefulWidget {
  static const String id = 'intro_page';
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late PageController _pageController;
  int currentCount = 0;
  bool isSkip = false;


  @override
  initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);


  }

  @override
  void dispose() {
    _pageController.dispose();
  }
void _nextPage(){
    Navigator.pushReplacementNamed(context, HomePage.id);
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (page) {
              setState(() {
                currentCount = page;
              });
            },
            children: [
              _makePage('assets/images/image_1.png', Strings.stepOneTitle,Strings.stepOneContent ),
              _makePage('assets/images/image_2.png', Strings.stepTwoTitle,Strings.stepTwoContent),
              _makePage('assets/images/image_3.png', Strings.stepThreeTitle, Strings.stepThreeContent),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 60),
child: Row(
  mainAxisAlignment: MainAxisAlignment.center,

  children:
_buildIndicators(),


),
          ),

        ],
      ),
      floatingActionButton: isSkip?  TextButton(onPressed: _nextPage,child:  Padding(
        padding: EdgeInsets.only(right: 20, left: 20),
        child: Text(
          'Skip',
          style: TextStyle(color: Colors.red, fontSize: 18),
        ),
      ),):null
    );
  }

  Widget _makePage(image, title, content) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50, bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  title,
                  style: TextStyle(color: Colors.red, fontSize: 30,fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: 20,),
              Text(
                content,
                style: TextStyle(color: Colors.grey, fontSize: 20,),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Image.asset(image),
              ),
            ],
          ),
        ],
      ),
    );
  }
  Widget _indicator(bool isActive,int count){

    return AnimatedContainer(duration: const Duration(milliseconds: 300,),
      height: 6,
      width: isActive? 30:6,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(5),
      ),


    );
  }
  List<Widget> _buildIndicators(){
    List<Widget> indicators = [];
    for(int i = 0; i < 3;i++){

      if(currentCount== i){
        indicators.add(_indicator(true,i));

      }else{
        indicators.add(_indicator(false,i));

      }
      setState((){
        if(currentCount == 2){
          isSkip = true;
        }else{
          isSkip = false;

        }
      });

    }
    return indicators;

  }
}
