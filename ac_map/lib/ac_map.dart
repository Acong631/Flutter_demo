import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


final viewType = 'ACMapView';
class ACMap extends StatefulWidget {
  
  final Function (MethodChannel channel) onPlatformViewCreated;
  ACMap({Key key, this.onPlatformViewCreated}) : super(key: key);

  @override
  _ACMapState createState() => _ACMapState();
}

class _ACMapState extends State<ACMap> {

  int viewId;
  MethodChannel channel;

  _initChannel(int id){
    viewId = id;
    channel = MethodChannel(viewType + '_$viewId');
    channel.invokeMethod("change",{'ZoomLevel':20});
    if(widget.onPlatformViewCreated != null){
      widget.onPlatformViewCreated(channel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: UiKitView(
         viewType: viewType,
         creationParams: {
           'ZoomLevel':17,
           'ShowMapScaleBar':true,
         },
         creationParamsCodec: StandardMessageCodec(),
         onPlatformViewCreated: _initChannel,
       ),
    );
  }


}