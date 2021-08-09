import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  GlobalKey _toolTipKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    double windowHeight = MediaQuery.of(context).size.height;
    double windowWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        //fit: StackFit.loose,
        //clipBehavior: Clip.hardEdge,
        children: [
          Positioned(
            top: 0,
            bottom: windowHeight * 0.65,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.blue,
              width: windowWidth,
              height: windowHeight * 0.3,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 25,
                      ),
                      Text(
                        'Events',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 120,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              child: ListView.builder(
                  itemCount: 100,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 10,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              child: Container(
                                width: windowWidth * 0.18,
                                height: windowHeight * 0.12,
                                decoration: BoxDecoration(
                                  image: index % 2 == 0
                                      ? DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              "https://i.pinimg.com/originals/f5/1d/08/f51d08be05919290355ac004cdd5c2d6.png"))
                                      : DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              "https://i.pinimg.com/originals/e3/01/28/e3012885013bc9373434750e8ea348f8.jpg")),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  color: Colors.redAccent,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Tournament ' + (index + 1).toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue.shade900,
                                  ),
                                ),
                                DetailsRow(
                                  icon: Icons.location_pin,
                                  detail: 'Palestine Gym',
                                ),
                                DetailsRow(
                                  icon: Icons.sports_football,
                                  detail: 'Ash vs Garry',
                                ),
                                DetailsRow(
                                  icon: Icons.calendar_view_week,
                                  detail:
                                      "Report At:\n22-September-2021,\n8:00:00PM",
                                ),
                              ],
                            ),
                            Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: GestureDetector(
                                onTap: () {
                                  final dynamic tooltip =
                                      _toolTipKey.currentState;
                                  tooltip.ensureTooltipVisible();
                                },
                                child: Tooltip(
                                  padding: EdgeInsets.symmetric(horizontal: 28),
                                  waitDuration: Duration(milliseconds: 5),
                                  verticalOffset: 20,
                                  preferBelow: false,
                                  decoration: BoxDecoration(
                                    color: Colors.blueGrey.shade900,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  //key: _toolTipKey,
                                  message: 'Enroll',
                                  child: CircleAvatar(
                                    radius: 30,
                                    child: FaIcon(
                                      FontAwesomeIcons.scroll,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class DetailsRow extends StatelessWidget {
  final String detail;
  final IconData icon;
  const DetailsRow({
    Key? key,
    required this.detail,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            size: 15,
          ),
          Text(detail),
        ],
      ),
    );
  }
}
