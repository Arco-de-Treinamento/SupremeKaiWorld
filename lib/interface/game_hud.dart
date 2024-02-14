import 'package:bonfire/bonfire.dart';

class GameHud extends GameInterface {
  late Sprite item;

  @override
  Future<void> onLoad() async {
    item = await Sprite.load('items/letter.png');
    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    try {
      _drawItem(canvas);
    } catch (e) {}
    super.render(canvas);
  }

  void _drawItem(Canvas c) {
      item.renderRect(c, Rect.fromLTWH(150, 20, 35, 30));
  }
}
