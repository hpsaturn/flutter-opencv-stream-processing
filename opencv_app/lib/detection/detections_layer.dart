import 'package:flutter/material.dart';

<<<<<<< HEAD
class DetectionsLayer extends StatelessWidget {
=======
class Aruco {
  var topLeft = Offset.zero;
  var topRight = Offset.zero;
  var bottomRight = Offset.zero;
  var bottomLeft = Offset.zero;
}

class DetectionsLayer extends StatefulWidget {
>>>>>>> 2766c00 (complete the detection code)
  const DetectionsLayer({
    Key? key,
    required this.arucos,
  }) : super(key: key);

  final List<double> arucos;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ArucosPainter(arucos: arucos),
    );
  }
}

class ArucosPainter extends CustomPainter {
  ArucosPainter({required this.arucos});

  // list of aruco coordinates, each aruco has 4 corners with x/y, total of 8 numbers per aruco
  final List<double> arucos;

  // paint we will use to draw to arucos
  final _paint = Paint()
    ..strokeWidth = 2.0
    ..color = Colors.red
    ..style = PaintingStyle.stroke;

  @override
<<<<<<< HEAD
=======
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ArucosPainter(arucos: widget.arucos),
    );
  }
}

class ArucosPainter extends CustomPainter {
  ArucosPainter({required this.arucos});

  final List<double> arucos;
  final p = Paint()
    ..strokeWidth = 2.0
    ..color = Colors.red
    ..style = PaintingStyle.stroke;

  @override
>>>>>>> 2766c00 (complete the detection code)
  void paint(Canvas canvas, Size size) {
    if (arucos.isEmpty) {
      return;
    }

    // Each aruco is 8 numbers (4 corners * x,y) and corners are starting from
    // top-left going clockwise
    final count = arucos.length ~/ 8;
    for (int i = 0; i < count; ++i) {
<<<<<<< HEAD
      // where current aruco coords starts
=======
>>>>>>> 2766c00 (complete the detection code)
      int arucoIdx = i * 8;

      // Draw the 4 lines of the aruco
      for (int j = 0; j < 4; ++j) {
<<<<<<< HEAD
        // each corner has x and y so we jump in 2
        final corner1Idx = arucoIdx + j * 2;

        // since the corners are clockwise we can take the next corner by adding 1 to j
        // making sure not to overflow to the next aruco, hence the modulo 8, so when
        // j=3 corner1 will be the bottom-left corner, and corner2 will be the top-left (like j=0)
        final corner2Idx = arucoIdx + ((j + 1) * 2) % 8;

        // Draw the line between the 2 corners
        final from = Offset(arucos[corner1Idx], arucos[corner1Idx + 1]);
        final to = Offset(arucos[corner2Idx], arucos[corner2Idx + 1]);
        canvas.drawLine(from, to, _paint);
=======
        final corner1 = arucoIdx + j * 2;
        final corner2 = arucoIdx + ((j + 1) * 2) % 8;

        final from = Offset(arucos[corner1], arucos[corner1 + 1]);
        final to = Offset(arucos[corner2], arucos[corner2 + 1]);

        canvas.drawLine(from, to, p);
>>>>>>> 2766c00 (complete the detection code)
      }
    }
  }

  @override
  bool shouldRepaint(ArucosPainter oldDelegate) {
<<<<<<< HEAD
    // We check if the arucos array was changed, if so we should re-paint
=======
>>>>>>> 2766c00 (complete the detection code)
    if (arucos.length != oldDelegate.arucos.length) {
      return true;
    }

    for (int i = 0; i < arucos.length; ++i) {
      if (arucos[i] != oldDelegate.arucos[i]) {
        return true;
      }
    }

    return false;
  }
}
