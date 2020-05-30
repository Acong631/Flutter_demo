import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class TheamDialog {


 static showAlertDialog(BuildContext context, {String title,@required String msg,String cancel,String sure,Function cancelAction,Function sureAction}){
   
   List<Widget> actions = [];
   if(cancel != null){
     actions.add(CupertinoButton(child: Text(cancel??'1',style: TextStyle(color: Colors.grey)), onPressed: (){
       Navigator.pop(context);
       if(cancelAction!=null){
         cancelAction();
       }
     }));
   }
   actions.add(CupertinoButton(child: Text(sure??'确定',style: TextStyle(color: Colors.blue),), onPressed: (){
      Navigator.pop(context);
       if(sureAction!=null){
         sureAction();
       }
   }),);

   showCupertinoDialog(
     context: context, 
     builder: (context){
        return CupertinoAlertDialog(
          title: Text(title ?? '温馨提示'),
          content: Container(
            child: Text(
              msg,
            ),
          ),
          actions: actions,
        );
     },
     
   );
 }


 static showToast(BuildContext context, {@required String msg}){
   Toast.show(msg, context, gravity: 1, duration: 2);
 }
}