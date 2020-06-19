//import 'package:event_bus/event_bus.dart';
import 'event_bus.dart';
//Bus初始化
EventBus eventBus = EventBus();
//广播数据

class ChangeIndexEventBus {
    int changeHeaderIndex;
    int changeSubIndex;

    ChangeIndexEventBus(int changeHeaderIndex, int changeSubIndex){
      this.changeHeaderIndex=changeHeaderIndex;
      this.changeSubIndex=changeSubIndex;
    }

}