import 'package:flutter/material.dart';

class DirectionButton extends StatelessWidget {
  const DirectionButton(this.move, {super.key});

  final Function(double dx, double dy) move;

  @override
  Widget build(BuildContext context) {
    double dx = 0;
    double dy = 0;
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage('assets/images/btn_direction.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      alignment: Alignment.center,
      child: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Draggable(
            onDragUpdate: (details) {
              setState(() {
                double r = dx * dx + dy * dy;
                dx += r > 2500 ? 0 : details.delta.dx;
                dy += r > 2500 ? 0 : details.delta.dy;
              });
              move(dx / 100, dy / 100);
            },
            onDragEnd: (details) {
              setState(() {
                dx = 0;
                dy = 0;
              });
            },
            // onPanUpdate: (details) {
            //   setState(() {
            //     double r = dx * dx + dy * dy;
            //     dx += r > 2500 ? 0 : details.delta.dx;
            //     dy += r > 2500 ? 0 : details.delta.dy;
            //   });
            //   move(dx / 100, dy / 100);
            // },
            // onPanEnd: (details) {
            //   setState(() {
            //     dx = 0;
            //     dy = 0;
            //   });
            // },
            feedback: const SizedBox(),
            child: Container(
              transform: Matrix4.translationValues(dx, dy, 0),
              child: Material(
                elevation: 10,
                shape: const CircleBorder(),
                color: Colors.transparent,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: const Color(0xffF8F5ED),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
