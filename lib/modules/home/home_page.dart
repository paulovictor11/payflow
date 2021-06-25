import 'package:flutter/material.dart';

import 'package:payflow/modules/extract/extract.dart';
import 'package:payflow/modules/meus_boletos/meus_boletos.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final User user;

  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final homeController = new HomeController();
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new PreferredSize(
        preferredSize: Size.fromHeight(152),
        child: new Container(
          height: 102,
          color: AppColors.primary,
          child: new Column(
            children: [
              new SizedBox(height: 30),
              new Center(
                child: new ListTile(
                  title: new Text.rich(
                    new TextSpan(
                      text: 'Olá, ',
                      style: AppTextStyles.titleRegular,
                      children: [
                        new TextSpan(text: widget.user.name, style: AppTextStyles.titleBoldBackground)
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
                      borderRadius: BorderRadius.circular(5),
                      image: new DecorationImage(
                        image: new NetworkImage(widget.user.photoUrl!)
                      )
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: [
        new MeusBoletosPage(key: new UniqueKey()),
        new ExtractPage(key: new UniqueKey())
      ][homeController.currentPage],
      bottomNavigationBar: new Container(
        height: 90,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            new IconButton(
              icon: new Icon(
                Icons.home,
                color: homeController.currentPage == 0 ? AppColors.primary : AppColors.body,
              ),
              onPressed: () {
                homeController.setPage(0);
                setState(() { });
              }
            ),
            new GestureDetector(
              onTap: () async {
                await Navigator.of(context).pushNamed('/barcode');
                setState(() { });
              },
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
                color: homeController.currentPage == 1 ? AppColors.primary : AppColors.body,
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