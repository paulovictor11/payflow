import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final homeController = new HomeController();
  final pages = [
    new Container(color: Colors.red),
    new Container(color: Colors.blue),
  ];
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new PreferredSize(
        preferredSize: Size.fromHeight(152),
        child: new Container(
          height: 152,
          color: AppColors.primary,
          child: new Center(
            child: new ListTile(
              title: new Text.rich(
                new TextSpan(
                  text: 'Olá, ',
                  style: AppTextStyles.titleRegular,
                  children: [
                    new TextSpan(text: 'Paulo Victor', style: AppTextStyles.titleBoldBackground)
                  ]
                ),
              ),
              subtitle: new Text(
                'Mantenha suas contas em dia',
                style: AppTextStyles.captionShape,
              ),
              trailing: new Container(
                height: 48, width: 48,
                decoration: new BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5)
                ),
              ),
            ),
          ),
        ),
      ),
      body: pages[homeController.currentPage],
      bottomNavigationBar: new Container(
        height: 90,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            new IconButton(
              icon: new Icon(
                Icons.home,
                color: AppColors.primary,
              ),
              onPressed: () {
                homeController.setPage(0);
                setState(() { });
              }
            ),
            new GestureDetector(
              onTap: () {},
              child: new Container(
                height: 56, width: 56,
                decoration: new BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: new Center(
                  child: new Icon(
                    Icons.add_box_outlined,
                    color: AppColors.background,
                  ),
                ),
              ),
            ),
            new IconButton(
              icon: new Icon(
                Icons.description_outlined,
                color: AppColors.body,
              ),
              onPressed: () {
                homeController.setPage(1);
                setState(() { });
              }
            )
          ],
        ),
      ),
    );
  }
}