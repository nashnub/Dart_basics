import 'dart:math' as math;

class Point {
  double x, y, z;

  Point(this.x, this.y, this.z);

  factory Point.zero() => Point(0, 0, 0);
  factory Point.dirX() => Point(1, 0, 0);
  factory Point.dirY() => Point(0, 1, 0);
  factory Point.dirZ() => Point(0, 0, 1);

  distanceTo(Point p) => lengthTo(p - this);

  double length() => lengthTo(this);

  double lengthTo(Point p) => math.sqrt(p.x * p.x + p.y * p.y + p.z * p.z);

  Point operator -(Point p) => Point(p.x - x, p.y - y, p.z - z);
}
