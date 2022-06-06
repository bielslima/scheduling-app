import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:scheduling_app/src/presentation/pages/home/view/widgets/header.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: AnimationLimiter(
            child: Column(
              children: AnimationConfiguration.toStaggeredList(
                duration: const Duration(milliseconds: 375),
                childAnimationBuilder: (widget) => SlideAnimation(
                  horizontalOffset: MediaQuery.of(context).size.width / 2,
                  child: FadeInAnimation(child: widget),
                ),
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Back'),
                  ),
                  const Header(),
                  EmptyCard(
                    width: MediaQuery.of(context).size.width,
                    height: 166.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const EmptyCard(height: 50.0, width: 50.0),
                        const EmptyCard(height: 50.0, width: 50.0),
                        const EmptyCard(height: 50.0, width: 50.0),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Flexible(child: EmptyCard(height: 150.0)),
                      const Flexible(child: EmptyCard(height: 150.0)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        const Flexible(child: EmptyCard(height: 50.0)),
                        const Flexible(child: EmptyCard(height: 50.0)),
                        const Flexible(child: EmptyCard(height: 50.0)),
                      ],
                    ),
                  ),
                  EmptyCard(
                    width: MediaQuery.of(context).size.width,
                    height: 166.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        const Flexible(child: EmptyCard(height: 50.0)),
                        const Flexible(child: EmptyCard(height: 50.0)),
                        const Flexible(child: EmptyCard(height: 50.0)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        const Flexible(child: EmptyCard(height: 50.0)),
                        const Flexible(child: EmptyCard(height: 50.0)),
                        const Flexible(child: EmptyCard(height: 50.0)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EmptyCard extends StatelessWidget {
  final double? width;
  final double? height;

  const EmptyCard({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            offset: Offset(0.0, 4.0),
          ),
        ],
      ),
    );
  }
}
