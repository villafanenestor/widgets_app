import 'dart:ffi';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class InfiniteScreen extends StatefulWidget {
  static const name = 'infinite_screen';
  const InfiniteScreen({super.key});

  @override
  State<InfiniteScreen> createState() => _InfiniteScreenState();
}

class _InfiniteScreenState extends State<InfiniteScreen> {

  // final screenSize = MediaQuery.of(context);
  final ScrollController scrollController = ScrollController();
  List<int> imageIds = [1,2,3,4,5];
  bool isLoading = false;
  bool isMounted = true;

  void addFiveImages(){
    final lastId = imageIds.last;
    setState(() {
      imageIds.addAll(
        [1,2,3,4,5].map((e) => lastId+e)
      );
    
    });
  }


  Future<void> loadNextPage() async{
    
    if(isLoading) return;
    setState(() {
    isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();
    isLoading=false;
    if(!isMounted) return;
    setState(() {
      
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      // print('posicion ${scrollController.position.pixels}');
      // print('max ${scrollController.position.maxScrollExtent}');
      // print('min ${scrollController.position.minScrollExtent}');
      double posicionActual = scrollController.position.pixels;
      double maxScroll = scrollController.position.maxScrollExtent;
      if(posicionActual>= (maxScroll*0.8)){
        print('LLego al 80% de la pantlla');
        loadNextPage();
        // addFiveImages();

      }
     });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    isLoading = false;
    super.dispose();
  }


  Future<void> onRefresh() async{
    await Future.delayed(const Duration(seconds: 3));
    if(!isMounted) return;
    final lastId = imageIds.last;
    isLoading=true;
    imageIds.clear();
    imageIds.add(lastId+1);
    addFiveImages();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView.builder(
            controller: scrollController,
            itemBuilder: (context, index){
            return FadeInImage(
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
              placeholder: AssetImage('assets/jar-loading.gif'), 
              image: NetworkImage('https://picsum.photos/id/${imageIds[index]}/500/300'));
          },
          itemCount: imageIds.length,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: !isLoading 
        ? Icon(Icons.arrow_back_ios) 
        : SpinPerfect(
          infinite: true,
          child: Icon(Icons.refresh_outlined)),
        ),
    );
  }
}