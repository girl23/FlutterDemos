///全局单例
typedef T CreateInstanceFn<T>();

class BaseSingleton {
  static final BaseSingleton _singleton = BaseSingleton._internal();

  final _factories = Map<String, dynamic>();

  factory BaseSingleton() {
    return _singleton;
  }

  BaseSingleton._internal();

  String _generateKey<T>(T type) {
    return '${type.toString()}_instance';
  }

  void add<T>(CreateInstanceFn<T> createInstance) {
    final typeKey = _generateKey(T);
    _factories[typeKey] = createInstance();
  }

  T get<T>() {
    final typeKey = _generateKey(T);
    T instance = _factories[typeKey];
    if (instance == null) {
      print('Cannot find instance for type $typeKey');
    }

    return instance;
  }
}
