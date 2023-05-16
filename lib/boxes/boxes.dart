

import 'package:hive/hive.dart';



class Boxes{
  static Box getData() => Hive.box('pBox');

}