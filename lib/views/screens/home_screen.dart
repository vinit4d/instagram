import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:instagram/config/extenstions/imagePaths.dart';
import '../../controller/home_controller.dart';
import '../../models/home_screen_model.dart';
import '../theme/theme_config.dart';
import '../widgets/bottom_sheets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HomeController(),
        initState: controller.fetchData(),
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'Instagram_logo'.toPng,
                        width: 110,
                        height: 40,
                        fit: BoxFit.cover,
                      ),
                      const Icon(Icons.keyboard_arrow_down_rounded)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.favorite_border,
                          size: 25,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        SvgPicture.asset(
                          'messenger'.toSvg,
                          width: 25,
                          height: 25,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            body: socialMediaPost(controller),
            bottomNavigationBar: Container(
              height: 60,
              padding: const EdgeInsets.only(bottom: 5),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    // topLeft: Radius.circular(20),
                    // topRight: Radius.circular(20),
                    ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(
                    Icons.home_filled,
                    size: 25,
                  ),
                  const Icon(
                    Icons.search_outlined,
                    size: 26,
                  ),
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(width: 1.8)),
                      child: const Icon(
                        Icons.add,
                        size: 16,
                      )),
                  SvgPicture.asset(
                    'reels'.toSvg,
                    width: 22,
                    height: 22,
                  ),
                  ClipOval(
                    child: SizedBox.fromSize(
                        size: const Size.fromRadius(12),
                        // Image radius
                        child: Image.network(controller.posts[3].profile!,
                            fit: BoxFit.cover)),
                  ),
                ],
              ),
            ),
          );
        });
  }

  static Widget socialMediaPost(HomeController ctrl) {
    return Obx(() {
      return RefreshIndicator(
          onRefresh: () => ctrl.shuffleList(),
          child: ListView.builder(
              itemCount: ctrl.posts.length,
              itemBuilder: (BuildContext context, int index) {
                var data = ctrl.posts[index];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(ctrl.data.value),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ClipOval(
                                child: SizedBox.fromSize(
                                    size: const Size.fromRadius(18),
                                    // Image radius
                                    child: Image.network(data.profile!,
                                        fit: BoxFit.cover)),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data.title!,
                                      style: ThemeConfig.styles.style14
                                          .copyWith(
                                              fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      data.createAge!,
                                      style: ThemeConfig.styles.style10,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const Icon(Icons.more_horiz)
                        ],
                      ),
                    ),
                    SizedBox(
                        height: ThemeConfig.dimens.width / 1.2,
                        width: ThemeConfig.dimens.width,
                        child: Image.network(
                          data.postImg!,
                          fit: BoxFit.cover,
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    ctrl.updateLike(index);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: data.like!
                                        ? const Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          )
                                        : const Icon(Icons.favorite_border),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    commentSection(context, data, ctrl, index);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: RotatedBox(
                                      quarterTurns: 3,
                                      child: SvgPicture.asset(
                                        'message'.toSvg,
                                        width: 22,
                                        height: 22,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: SvgPicture.asset(
                                    'send'.toSvg,
                                    width: 22,
                                    height: 22,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: SvgPicture.asset(
                            'save'.toSvg,
                            width: 28,
                            height: 28,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Row(
                        children: [
                          ClipOval(
                            child: SizedBox.fromSize(
                                size: const Size.fromRadius(10),
                                // Image radius
                                child: Image.network(data.profile!,
                                    fit: BoxFit.cover)),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: RichText(
                              text: TextSpan(
                                  text: 'Liked by',
                                  style: ThemeConfig.styles.style14,
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ' ${data.likeby}',
                                        style: ThemeConfig.styles.style14
                                            .copyWith(
                                                fontWeight: FontWeight.bold)),
                                    TextSpan(
                                        text: ' and',
                                        style: ThemeConfig.styles.style14),
                                    TextSpan(
                                        text: ' others',
                                        style: ThemeConfig.styles.style14
                                            .copyWith(
                                                fontWeight: FontWeight.bold)),
                                  ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: RichText(
                        text: TextSpan(
                            text: '${data.title}',
                            style: ThemeConfig.styles.style14
                                .copyWith(fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                  text: ' ${data.description}',
                                  style: ThemeConfig.styles.style14
                                      .copyWith(fontWeight: FontWeight.normal)),
                            ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Text(
                          "View all ${ctrl.posts[index].comments != null ? ctrl.posts[index].comments!.length : "10"} comments"),
                    )
                  ],
                );
              }));
    });
  }
}

commentSection(BuildContext context, HomeScreenModel data, HomeController ctrl,
    int mainIdx) {
  BottomSheets.showModelSheet(
      context: context,
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: SizedBox(
                      width: 40,
                      child: Divider(height: 1, thickness: 3),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 30,
                      ),
                      Text(
                        "Comments",
                        style: ThemeConfig.styles.style20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: SvgPicture.asset(
                          'send'.toSvg,
                          width: 30,
                          height: 30,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
              thickness: 0.4,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.comments?.length,
                    itemBuilder: (BuildContext context, int idx) {
                      var comments = data.comments![idx];
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: ClipOval(
                              child: SizedBox.fromSize(
                                  size: const Size.fromRadius(20),
                                  // Image radius
                                  child: Image.network(comments.profile!,
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                    text: TextSpan(
                                        style: ThemeConfig.styles.style13
                                            .copyWith(
                                                fontWeight: FontWeight.w600),
                                        text: comments.name!,
                                        children: [
                                      TextSpan(
                                          text: " ${comments.commentTime}",
                                          style: ThemeConfig.styles.style12
                                              .copyWith(color: Colors.grey))
                                    ])),
                                Text(
                                  comments.commentTxt!,
                                  style: ThemeConfig.styles.style16,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 5.0),
                                  child: Text(
                                    "Reply",
                                    style: ThemeConfig.styles.style16
                                        .copyWith(color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                      // Column(children: [Expanded(child: Text("comments.name!"))],);
                    }),
              ),
            ),
            Container(
                decoration: const BoxDecoration(
                    border: Border(
                  top: BorderSide(
                    color: Colors.grey,
                    width: 0.4,
                  ),
                )),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20, bottom: 4, right: 8, left: 8),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ClipOval(
                          child: SizedBox.fromSize(
                              size: const Size.fromRadius(22),
                              // Image radius
                              child: Image.network(data.profile!,
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 8, left: 15, right: 15),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(25)),
                          child: TextFormField(
                              controller: ctrl.comment.value,
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                isCollapsed: true,
                                contentPadding: EdgeInsets.zero,
                                hintStyle: TextStyle(color: Colors.grey[800]),
                                hintText: "Add a comment...",
                                fillColor: Colors.white70,
                                suffix: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_upward_rounded,
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ));
}
