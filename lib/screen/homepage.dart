import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  double cm = 00;
  int weight = 40;
  int age = 18;
  int selectOn = 0;
  int selectOff = 0;
  double result = 1;
  double value = 0;
  Color male = Colors.black;
  Color female = Colors.black;
  List<Color> select = [
    Colors.pink,
    Colors.white,
  ];

  late AnimationController animationController;

  Animation<Offset>? femaleAnimation;
  Animation<Offset>? maleAnimation;
  Animation<Offset>? heightAnimation;
  Animation<Offset>? weightAnimation;
  Animation<Offset>? ageAnimation;
  Animation<Offset>? buttonAnimation;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      animationBehavior: AnimationBehavior.preserve,
      duration: const Duration(seconds: 2),
    );

    femaleAnimation = Tween<Offset>(
      begin: const Offset(-1, 5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceOut,
    ));

    maleAnimation = Tween<Offset>(
      begin: const Offset(8, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceOut,
    ));

    heightAnimation = Tween<Offset>(
      begin: const Offset(-1, 2),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceOut,
    ));

    weightAnimation = Tween<Offset>(
      begin: const Offset(5, -5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceOut,
    ));

    ageAnimation = Tween<Offset>(
      begin: const Offset(-5, 5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceOut,
    ));

    buttonAnimation = Tween<Offset>(
      begin: const Offset(1, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.bounceOut,
    ));

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text("BMI Calculator"),
        backgroundColor: const Color(0xff090e21),
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  const Spacer(),
                  SlideTransition(
                    position: femaleAnimation!,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectOff = 1;
                          selectOn = 0;
                        });
                      },
                      child: Ink(
                        child: Container(
                          height: h * 0.24,
                          width: w * 0.45,
                          decoration: BoxDecoration(
                            color: (selectOff == 1)
                                ? const Color(0xff3b3c4d)
                                : const Color(0xff1d1e33),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.female,
                                size: 130,
                                color: (selectOff == 1)
                                    ? const Color(0xffeb1555)
                                    : Colors.white,
                              ),
                              Text(
                                "Female",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: (selectOff == 1)
                                      ? const Color(0xffeb1555)
                                      : Colors.white,
                                  fontWeight: (selectOff == 1)
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  SlideTransition(
                    position: maleAnimation!,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectOn = 1;
                          selectOff = 0;
                        });
                      },
                      child: Ink(
                        child: Container(
                          height: h * 0.24,
                          width: w * 0.45,
                          decoration: BoxDecoration(
                            color: (selectOn == 1)
                                ? const Color(0xff3b3c4d)
                                : const Color(0xff1d1e33),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.male,
                                size: 130,
                                color: (selectOn == 1)
                                    ? const Color(0xffeb1555)
                                    : Colors.white,
                              ),
                              Text(
                                "Male",
                                style: TextStyle(
                                  fontSize: 24,
                                  color: (selectOn == 1)
                                      ? const Color(0xffeb1555)
                                      : Colors.white,
                                  fontWeight: (selectOn == 1)
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: SlideTransition(
                position: heightAnimation!,
                child: Container(
                  height: h * 0.24,
                  width: w * 0.95,
                  decoration: BoxDecoration(
                    color: const Color(0xff1d1e33),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10),
                        height: 60,
                        decoration: BoxDecoration(
                          // color: Color(0xff3b3c4d),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "HEIGHT",
                          style: TextStyle(
                            color: Color(0xff3D3C4D),
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: "${cm.toInt()}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const TextSpan(
                                  text: " cm",
                                  style: TextStyle(
                                    color: Color(0xff626473),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SliderTheme(
                        data: const SliderThemeData(
                          thumbColor: Color(0xffeb1555),
                          trackHeight: 1,
                          activeTickMarkColor: Color(0xff555555),
                          activeTrackColor: Color(0xff555555),
                        ),
                        child: Slider(
                            min: 00,
                            max: 250,
                            value: cm,
                            onChanged: (val) {
                              cm = val;
                              setState(() {});
                            }),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  const Spacer(),
                  SlideTransition(
                    position: weightAnimation!,
                    child: Container(
                      height: h * 0.24,
                      width: w * 0.45,
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        color: const Color(0xff1d1e33),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            "weight",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "${weight}",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 45,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                child: Container(
                                  height: 55,
                                  width: 55,
                                  decoration: const BoxDecoration(
                                    color: Color(0xff4c4f5c),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.remove,
                                    size: 30,
                                    color: Color(0xfff67fa4),
                                  ),
                                ),
                                onTap: () {
                                  if (weight > 0) {
                                    weight--;
                                  }
                                  ;
                                  setState(() {});
                                },
                              ),
                              InkWell(
                                child: Container(
                                  height: 55,
                                  width: 55,
                                  decoration: const BoxDecoration(
                                    color: Color(0xff6e6f7a),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    size: 30,
                                    color: Color(0xfff67fa4),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  SlideTransition(
                    position: ageAnimation!,
                    child: Container(
                      height: h * 0.24,
                      width: w * 0.45,
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        color: const Color(0xff1d1e33),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Text(
                            "Age",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            "$age",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 45,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              InkWell(
                                  child: Container(
                                    height: 55,
                                    width: 55,
                                    decoration: const BoxDecoration(
                                      color: Color(0xff4c4f5c),
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.remove,
                                      size: 30,
                                      color: Color(0xfff67fa4),
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      age--;
                                    });
                                  }),
                              InkWell(
                                child: Container(
                                  height: 55,
                                  width: 55,
                                  decoration: const BoxDecoration(
                                    color: Color(0xff6e6f7a),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    size: 30,
                                    color: Color(0xfff67fa4),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            SlideTransition(
              position: buttonAnimation!,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    value = cm / 100;
                    result = weight / (value * value);
                  });
                  setState(() {
                    showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(20),
                      ),
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: h * 0.4,
                          decoration: const BoxDecoration(
                            color: Color(0xff090e21),
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Text(
                                  "NORMAL",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "RESULT: ${result.toInt().toString()}",
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const Text(
                                  "You Have a normal body weight. \n                      Good Job...",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  });
                },
                child: Container(
                  height: h * 0.1,
                  width: w * 0.95,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xffeb1555),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    "Calculator ",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: h * 0.02,
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xff090e21),
    );
  }
}