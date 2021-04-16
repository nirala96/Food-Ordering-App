import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_page_day_23/services/catalog_services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get_it/get_it.dart';
import 'package:login_page_day_23/models/catalogmodel.dart';


class AdminDashboard extends StatefulWidget {
  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        title: new Text("Swiggato - Admin DashBoard"),
      ),
      body: CatalogList(),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add),),
    );
  }
}


class CatalogList extends StatefulWidget {
  @override
  _CatalogListState createState() => _CatalogListState();
}


class _CatalogListState extends State<CatalogList> {
  CatalogServices get service => GetIt.I<CatalogServices>();

  List<CatalogModel> items = [];

  @override
  void initState() {
    items = CatalogServices.getCatalogList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index){
          final catalog = items[index];
          return InkWell(
            child: CatalogItem(catalog : catalog),
            //  onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeDetailPage(catalog: catalog,))),
          );
        }
    );
  }
}

class CatalogItem extends StatelessWidget {
  final CatalogModel catalog;

  const CatalogItem({Key key,@required this.catalog})
      : assert(catalog !=null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),

              child: CatalogImage(
                image: catalog.image,
              ),
            ),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.title.text.lg.color(Color(0xff403b58)).bold.make(),
                catalog.type.text.textStyle(context.captionStyle).color(Color(0xff403b58)).make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog.price}".text.xl.bold.make(),

                  ],
                ).pOnly(right: 8.0)
              ],
            ))
          ],
        )
    ).color(Colors.white).roundedLg.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key key,@required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.rounded.p8.color(context.canvasColor).make().p16().w40(context);
  }
}



