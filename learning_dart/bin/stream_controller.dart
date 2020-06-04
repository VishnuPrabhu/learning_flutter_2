import 'dart:async';

class Cake {}

class Order {
  String type;
  Order(this.type);
}

void main() {
  final controller = StreamController<Order>();

  final order = Order('chocolate');

  final bakerTransformer = StreamTransformer<String, Cake>.fromHandlers(
      handleData: (cakeType, sink) {
    if (cakeType == 'chocolate') {
      sink.add(Cake());
    } else {
      sink.addError('I cant bake that type!!!');
    }
  });

  controller.sink.add(order);

  controller.stream
      .map((order) => order.type)
      .transform(bakerTransformer)
      .listen(
        (cake) => print('Here\'s your cake $cake'),
        onError: (error) => print(error),
      );
}
