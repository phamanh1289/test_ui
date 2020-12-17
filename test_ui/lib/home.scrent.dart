import 'package:flutter/material.dart';
import 'package:test_ui/menu.model.dart';
import 'package:test_ui/resource/image.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Size sizeScreen;
  @override
  Widget build(BuildContext context) {
    sizeScreen = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        height: sizeScreen.height,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _itemBanner(img_top_banner, 0.3),
                  _itemProfile(),
                  _itemMenu(),
                  _itemBanner(img_mid_banner, 0.15),
                  _itemNews()
                ],
              ),
              Positioned(
                top: sizeScreen.height * 0.27,
                child: _itemSearch(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _itemBanner(String url, double size, [double width = 1]) => Image(
        image: AssetImage(url),
        fit: BoxFit.fill,
        height: sizeScreen.height * size,
        width: sizeScreen.width * width,
      );

  _itemProfile() => Container(
        padding: EdgeInsets.all(16),
        height: sizeScreen.height * 0.15,
        color: Colors.grey[100],
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            _itemRect(img_mid_banner),
            Expanded(child: _itemHello()),
            Image(
              image: AssetImage(ic_wather),
            )
          ],
        ),
      );

  _itemRect(String url) => ClipRRect(
        child: Image(
          image: AssetImage(url),
          fit: BoxFit.cover,
          height: 50,
          width: 50,
        ),
        borderRadius: BorderRadius.circular(90),
      );

  _itemHello() => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Xin chào, Ngân",
              style: style(size: 15, color: Colors.black),
            ),
            Text(
              "hôm nay bạn thế nào?",
              style: style(size: 13, color: Colors.grey),
            ),
          ],
        ),
      );

  _itemSearch() => Container(
        height: sizeScreen.height * 0.07,
        width: sizeScreen.width - 48,
        margin: EdgeInsets.symmetric(horizontal: 24),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration.collapsed(
                    hintText: "Tim kiem, ban muon tim kiem gi nao!"),
              ),
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              child: Icon(
                Icons.search,
                size: 15,
                color: Colors.white,
              ),
            )
          ],
        ),
      );

  _itemMenu() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Tien ich danh cho ban",
              style: style(size: 17, color: Colors.black, bold: true),
            ),
          ),
          GridView.builder(
              padding: EdgeInsets.all(0.0),
              shrinkWrap: true,
              itemCount: listMenu.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.85,
                crossAxisCount: 4,
              ),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return _itemMenuDetail(listMenu[index]);
              })
        ],
      );

  _itemMenuDetail(MenuModel model) => Column(
        children: [
          _itemRect(model.image),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              model.title,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          )
        ],
      );

  _itemNews() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Tin tuc moi nhat",
              style: style(size: 17, color: Colors.black, bold: true),
            ),
          ),
          GridView.builder(
              padding: EdgeInsets.all(0.0),
              shrinkWrap: true,
              itemCount: listNews.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1,
                crossAxisCount: 2,
              ),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return _itemNewDetail(listNews[index]);
              })
        ],
      );

  _itemNewDetail(MenuModel model) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _itemBanner(model.image, 0.13),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Text(
                model.title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: style(
                  size: 14,
                  bold: true,
                ),
              ),
            )
          ],
        ),
      );

  TextStyle style({double size, Color color, bool bold = false}) => TextStyle(
      fontSize: size,
      color: color,
      fontWeight: bold ? FontWeight.w600 : FontWeight.w300);

  List<MenuModel> listMenu = [
    MenuModel(title: "Bao ton that xe", image: ic_menu_1),
    MenuModel(title: "Bao hiem con nguoi", image: ic_menu_2),
    MenuModel(title: "Mang luoi GARA", image: ic_menu_3),
    MenuModel(title: "Co so y te bao lanh", image: ic_menu_4),
    MenuModel(title: "Tra cuu GCN", image: ic_menu_5),
    MenuModel(title: "Lich su hop dong", image: ic_menu_6),
    MenuModel(title: "Huong dan boi thuong", image: ic_menu_7),
    MenuModel(title: "Tien ich khac", image: ic_menu_8),
  ];

  List<MenuModel> listNews = [
    MenuModel(
        title: "Bao hiem xe may  Bao hiem xe may Bao hiem xe may ",
        image: img_new_1),
    MenuModel(
        title:
            "Bao hiem xe may Bao hiem xe may Bao Bao hiem xe may Bao hiem xe may Bao hiem xe  hiem xe may Bao hiem xe may ",
        image: img_new_2),
    MenuModel(
        title:
            "Bao hiem xe may Bao hiem xe may Bao hiem xe may Bao hiem hiem xe may Bao hiem xe may Bao  hiem xe may Bao hiem xe may Bao  xe may Bao hiem xe may Bao hiem xe may Bao hiem xe ",
        image: img_new_3),
    MenuModel(
        title:
            "Bao hiem xe may Bao hiem xe may Bao hiem xe may Bao hiem xe may ",
        image: img_new_4),
  ];
}
