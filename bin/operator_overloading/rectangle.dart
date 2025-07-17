// Thsi file is made to do some extra practice of Operator Overloading.
// Actually I want to use previous all concepts in this file.

import 'dart:convert';

class Rectangle {
  // private datamembers of Rectangle class.
  num _height;
  num _width;

  // Properties for _height and _width.
  num get height => _height;
  set height(num input) {
    if (input > 0.0) {
      _height = input;
    } else {
      throw Exception('$input must be greater then 0');
    }
  }

  num get width => _width;
  set width(num input) {
    if (input > 0.0) {
      _width = input;
    } else {
      throw Exception('$input must be greater then 0');
    }
  }

  // Named optional default parameterized Constructor.
  // As we have private fields and we need named parameters so we use imitilization list.
  Rectangle({num h = 1, num w = 1})
      : _height = h,
        _width = w;
  // In above constructor if user pass -ve value it will also assign to fields because initilization is occuring in initilization list which executes before the body of constructor.
  // As we can only use setters and getters in function body. So if we want to use setters to set values of fields according to abstraction then we have to use property in bode of constructor like below:
  // Rectangle({num h = 1, num w = 1}) {
  //   height = h;   // uses setter
  //   width = w;   // uses setter
  // }

  // Named Constructor with constructor redirecting.
  Rectangle.fromJson(String json) : this.fromMap(jsonDecode(json));
  Rectangle.fromMap(Map<String, dynamic> map)
      : this(h: map['height'], w: map['width']);

  // So called Operator Overloading.
  @override
  bool operator ==(covariant Rectangle object) {
    return height == object._height && _width == object._width;
  }

  bool operator >=(Rectangle object) {
    return _height > object._height && _width == object._width;
  }

  bool operator <=(Rectangle object) {
    return _width < object._width && _height == object._height;
  }

  // We use Property(getters) in below.
  Rectangle operator +(Rectangle object) {
    return Rectangle(h: height + object.height, w: width + object.width);
  }

  // toString method.
  @override
  String toString() {
    return 'Height: $_height, Width: $width';
  }
}
