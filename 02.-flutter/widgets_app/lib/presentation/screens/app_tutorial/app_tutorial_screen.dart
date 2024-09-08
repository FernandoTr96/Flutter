import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo{
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo({required this.title, required this.caption, required this.imageUrl});
}

final slides = <SlideInfo>[
  SlideInfo(title: 'Busca la comida', caption: 'Laboris pariatur dolor do non veniam commodo consequat eu tempor do est consectetur cillum.', imageUrl: 'assets/images/1.png'),
  SlideInfo(title: 'Entrega rapida', caption: 'Laboris pariatur dolor do non veniam commodo consequat eu tempor do est consectetur cillum.', imageUrl: 'assets/images/2.png'),
  SlideInfo(title: 'Disfruta la comida', caption: 'Laboris pariatur dolor do non veniam commodo consequat eu tempor do est consectetur cillum.', imageUrl: 'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  
  static const name = 'app_tutorial_screen';
  
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  
 bool showSkip = false;
 final PageController pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page =  pageViewController.page ?? 0;
      if(!showSkip && page >= (slides.length - 1.5)){
        setState(() {
          showSkip = true;
        });
      }
    },);
  }

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutorial guiado'),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides.map((s)=> _Slide(title: s.title, caption: s.caption, imagenUrl: s.imageUrl)).toList()
          ),
          showSkip ? Positioned( 
            bottom: 30,
            right: 30,           
            child: TextButton(onPressed: () => context.pop(), child: const Text('Skip'))
          ) : const SizedBox()
        ] 
      )
    );
  }
}


class _Slide extends StatelessWidget {

  final String title;
  final String caption;
  final String imagenUrl;

  const _Slide({required this.title, required this.caption, required this.imagenUrl});

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagenUrl),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 10),
            Text(caption, style: captionStyle),
          ]
        ),
      ),
    );
  }
}