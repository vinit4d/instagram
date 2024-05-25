import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import '../theme/theme_config.dart';

class BottomSheets {
  static void showBottomSheets(
      {required BuildContext context,
      required double height,
      required Widget child,
      bool willPop = false}) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: WillPopScope(
            onWillPop: () async => willPop,
            child: SizedBox(
              height: height + 80,
              child: Container(
                height: height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                  color: Colors.white,
                ),
                child:
                    Padding(padding: const EdgeInsets.all(12.0), child: child),
              ),
            ),
          ),
        );
      },
    );
  }

  static Future<bool?> showAlertDialog(
      {required BuildContext context,
      required String title,
      required Widget child,
      required List<Widget>? actions,
      bool isDismissible = true}) async {
    bool? pop = await showDialog<bool?>(
      context: context,
      barrierDismissible: isDismissible,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => isDismissible,
          child: AlertDialog(
            title: Text(
              title,
              style: ThemeConfig.styles.style16,
            ),
            content: child,
            actions: actions,
          ),
        );
      },
    );
    return pop ?? false;
  }

  // static void showBottomSheet({required BuildContext context,required double height,required Widget child, bool willPop = false, bool draggable = false}){
  //   showMaterialModalBottomSheet(
  //       context: context,
  //       elevation: 8,
  //       isDismissible: draggable,
  //       enableDrag: draggable,
  //       backgroundColor: Colors.transparent,
  //       builder: (context) {
  //         return  Padding(
  //           padding: EdgeInsets.only(
  //               bottom: MediaQuery.of(context).viewInsets.bottom),
  //           child: WillPopScope(
  //             onWillPop: () async => willPop,
  //             child: SizedBox(
  //               height: height+80,
  //               child: Stack(
  //                 children: [
  //                   Align(
  //                     alignment: Alignment.topCenter,
  //                     child: Container(
  //                       width: 50.0,
  //                       height: 50.0,
  //                       decoration: new BoxDecoration(
  //                         color: Colors.black,
  //                         shape: BoxShape.circle,
  //                       ),
  //                       child: Center(
  //                         child: IconButton(
  //                             onPressed: () {
  //                               SystemChrome.setPreferredOrientations([
  //                                 DeviceOrientation.portraitUp,
  //                                 DeviceOrientation.portraitDown,
  //                               ]);
  //                               Navigator.pop(context);
  //                             },
  //                             icon: Icon(
  //                               Icons.close,
  //                               color: Colors.white,
  //                             )),
  //                       ),
  //                     ),
  //                   ),
  //                   Align(
  //                     alignment: Alignment.bottomCenter,
  //                     child: Container(
  //                       height: height,
  //                       width: MediaQuery.of(context).size.width,
  //                       decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.only(
  //                             topRight: Radius.circular(30),
  //                             topLeft: Radius.circular(30)),
  //                         color: Colors.white,
  //                       ),
  //                       child: Padding(
  //                           padding: const EdgeInsets.all(12.0),
  //                           child: child
  //                       ),
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ),
  //         );
  //       });
  //
  // }
  static void showMBottomSheet(
      {required BuildContext context,
      required double height,
      required Widget child,
      bool willPop = false,
      bool draggable = false}) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (context) => Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: WillPopScope(
              onWillPop: () async => willPop,
              child: SizedBox(
                height: height + 80,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: new BoxDecoration(
                          color: Colors.black,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: IconButton(
                              onPressed: () {
                                SystemChrome.setPreferredOrientations([
                                  DeviceOrientation.portraitUp,
                                  DeviceOrientation.portraitDown,
                                ]);
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.close,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: height,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(30),
                              topLeft: Radius.circular(30)),
                          color: Colors.white,
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(12.0), child: child),
                      ),
                    )
                  ],
                ),
              ),
            )));
  }

  // static void showBottomSheets({required BuildContext context,required double height,required Widget child, bool willPop = false}){
  //   showMaterialModalBottomSheet(
  //       context: context,
  //       elevation: 8,
  //       isDismissible: false,
  //       enableDrag: false,
  //       backgroundColor: Colors.transparent,
  //       builder: (context) {
  //         return  WillPopScope(
  //           onWillPop: () async => willPop,
  //           child: SizedBox(
  //             height: height+80,
  //             child: Container(
  //               height: height,
  //               width: MediaQuery.of(context).size.width,
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.only(
  //                     topRight: Radius.circular(30),
  //                     topLeft: Radius.circular(30)),
  //                 color: Colors.white,
  //               ),
  //               child: Padding(
  //                   padding: const EdgeInsets.all(12.0),
  //                   child: child
  //               ),
  //             ),
  //           ),
  //         );
  //       });
  //
  // }

  // static void showBSHorizontal({required BuildContext context,required double height,required Widget child, bool willPop = false, bool draggable = false}){
  //   showMaterialModalBottomSheet(
  //       context: context,
  //       elevation: 8,
  //       isDismissible: draggable,
  //       enableDrag: draggable,
  //       expand: true,
  //       backgroundColor: Colors.transparent,
  //       builder: (context) {
  //         return  WillPopScope(
  //           onWillPop: () async => willPop,
  //           child: SizedBox(
  //             height: height,
  //             child: Stack(
  //               children: [
  //                 Align(
  //                   alignment: Alignment.bottomCenter,
  //                   child: Container(
  //                     height: height,
  //                     width: MediaQuery.of(context).size.width,
  //                     decoration: const BoxDecoration(
  //                       // borderRadius: BorderRadius.only(
  //                       //     topRight: Radius.circular(30),
  //                       //     topLeft: Radius.circular(30)),
  //                       color: Colors.white,
  //                     ),
  //                     child: Padding(
  //                         padding: const EdgeInsets.all(12.0),
  //                         child: child
  //                     ),
  //                   ),
  //                 ),
  //                 Align(
  //                   alignment: Alignment.bottomRight,
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(16.0),
  //                     child: Container(
  //                       width: 100.0,
  //                       height: 40.0,
  //                       decoration:  BoxDecoration(
  //                           color: Colors.black,
  //                           borderRadius: BorderRadius.circular(40)
  //                       ),
  //                       child: Center(
  //                         child: IconButton(
  //                           onPressed: () {
  //                             SystemChrome.setPreferredOrientations([
  //                               DeviceOrientation.portraitUp,
  //                               DeviceOrientation.portraitDown,
  //                             ]);
  //                             Navigator.pop(context);
  //                           },
  //                           icon:Text("Close",style: ThemeConfig.styles.style14),),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  //
  // }
  //
  // static void showOMSheet({required BuildContext context,required double height,required Widget child, bool willPop = false, bool draggable = false}){
  //   showMaterialModalBottomSheet(
  //       context: context,
  //       elevation: 8,
  //       isDismissible: draggable,
  //       enableDrag: draggable,
  //       backgroundColor: Colors.transparent,
  //       builder: (context) {
  //         return  WillPopScope(
  //           onWillPop: () async => willPop,
  //           child: SizedBox(
  //             height: height,
  //             child: Container(
  //               height: height,
  //               width: MediaQuery.of(context).size.width,
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.only(
  //                     topRight: Radius.circular(30),
  //                     topLeft: Radius.circular(30)),
  //                 color: Colors.white,
  //               ),
  //               child: Padding(
  //                   padding: const EdgeInsets.only(top: 50,left: 12,right: 12,bottom: 12),
  //                   child: child
  //               ),
  //             ),
  //           ),
  //         );
  //       });
  //
  // }

  static Future<void> showAlertDialogWithoutTitle(
      {required BuildContext context,
      required Widget child,
      required List<Widget>? actions,
      bool isDismissible = true}) async {
    await showDialog(
      context: context,
      barrierDismissible: isDismissible,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => isDismissible,
          child: AlertDialog(
            content: Builder(
              builder: (context) {
                // Get available height and width of the build area of this widget. Make a choice depending on the size.
                var height = MediaQuery.of(context).size.height;
                var width = MediaQuery.of(context).size.width;

                return child;
              },
            ),
            actions: actions,
          ),
        );
      },
    );
  }

  static void showModelSheet(
      {required BuildContext context,
      required Widget child,
      bool willPop = true,
      bool draggable = true}) {
    showModalBottomSheet(
        context: context,
        elevation: 8,
        isDismissible: draggable,
        enableDrag: draggable,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return PopScope(
            onPopInvoked: (v) => willPop,
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 0, right: 0, bottom: 16),
                    child: child
                    // SingleChildScrollView(
                    //     physics: const BouncingScrollPhysics(), child: child)
                ),
              ),
            ),
          );
        });
  }
}
