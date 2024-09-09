import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {

  static const name = 'infinite_scroll_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  
  bool isMounted = true;
  bool isLoading = false;
  List<int> imagesIDS = [1,2,3,4,5];
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener((){
      if((scrollController.position.pixels + 500) >= scrollController.position.maxScrollExtent){
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    isMounted = false;
    scrollController.dispose();
  }

  void moveScrollToBottom(){
    if(scrollController.position.pixels + 150 <= scrollController.position.maxScrollExtent) return;
    scrollController.animateTo(
      scrollController.position.pixels + 120, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.fastOutSlowIn
    );
  }

  Future onRefresh() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {});
    if(!isMounted) return;
    isLoading = true;
    final lastId = imagesIDS.last;
    imagesIDS.clear();
    imagesIDS.add(lastId+1);
    addFiveImages();
    setState(() {});
  }

  Future loadNextPage() async{
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));
    addFiveImages();
    isLoading = false;
    if(!isMounted) return;
    setState(() {});
    moveScrollToBottom();
  }

  void addFiveImages(){
    final lastId = imagesIDS.last;
    imagesIDS.addAll([1,2,3,4,5].map((e) => lastId + e));
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
            itemCount: imagesIDS.length,
            itemBuilder: (context, index) {
             return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading.gif'), 
                image: NetworkImage('https://picsum.photos/id/${imagesIDS[index]}/500/300')
              );
            }
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=> context.pop(),
        child: const Icon(Icons.arrow_back), 
      )
    );
  }
}