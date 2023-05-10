import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;
  SlideInfo({required this.title, required this.caption, required this.imageUrl});
}

final slides = <SlideInfo> [
  SlideInfo(caption: 'los mejores platillos', imageUrl: 'assets/1.png', title: 'busca la camida'),
  SlideInfo(caption: 'Tus comidas favoritas', imageUrl: 'assets/2.png', title: 'busca la camida'),
  SlideInfo(caption: 'Excelentes precios en todos los restaurantes', imageUrl: 'assets/3.png', title: 'busca la camida'),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {

  late final PageController pageViewcontroller = PageController();
  bool isendPage = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageViewcontroller.addListener(() {
      // print('${pageViewcontroller}');
      final page = pageViewcontroller.page ?? 0;
      if( !isendPage && page>=(slides.length -1.5)){
        setState(() {
        isendPage=true;
        });
      }else{
        isendPage=false;
      }

      // print('${pageViewcontroller.page}');
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    pageViewcontroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewcontroller,
            
            children: 
              slides.map((slideData) => _Slide(
                title: slideData.title, 
                caption: slideData.caption, 
                imageUrl: slideData.imageUrl) ).toList()
            
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
            child: const Text('SALIR'),
            onPressed: ()=> context.pop(),
          ),
          ),
          isendPage ?
          Positioned(
            bottom: 20,
            right: 30,
            child: FadeInRight(
              from: 15,
              delay: Duration(seconds: 1),

              child: FilledButton(onPressed: ()=> context.pop(), 
                child: const Text('Comenzar'),
                ),
            ),
          ): const SizedBox(),
        ],
      ),
    );
  }
}







class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;
  const _Slide({required this.title, required this.caption, required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            SizedBox(height: 20,),
            Text(title, style: titleStyle,),
            SizedBox(height: 10,),
            Text(caption, style: captionStyle,),
            
          ],
        ),
      ),

    );
  }
}