import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_ordering_app/models/ApiError.dart';
import 'package:food_ordering_app/models/ApiRespose.dart';
import 'package:food_ordering_app/models/UserDetails.dart';
import 'package:food_ordering_app/services/user_details_services.dart';
import 'package:food_ordering_app/views/profile_screen.dart';
import 'package:food_ordering_app/services/catalog_services.dart';
import 'package:food_ordering_app/views/widgets/msgToast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get_it/get_it.dart';
import '../models/catalogmodel.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.account_circle),
          onPressed: () {
            _ProfileHandler(context);
          },
        ),
//        leading: Icon(
//
//          Icons.dehaze,
//          color: Colors.white,
//
//        ),
        title: new Text("Swiggato - DashBoard"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
//            Navigator.push(context, MaterialPageRoute(builder: (context)=>PatientScreen()),
//          );
                //onpressed action
              })
        ],
      ),
      body: CatalogList(),
    );
  }
}

void _ProfileHandler(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String _userId = (prefs.getString("user_id") ?? "");
  if (_userId == "") {
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/home',
      ModalRoute.withName('/home'),
    );
    showToastMsg("invalid Login State!");
  } else {
    ApiResponse _apiResponse = await getUserDetails(_userId);
    if ((_apiResponse.ApiError as ApiError) == null) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/profile',
        ModalRoute.withName('/profile'),
        arguments: (_apiResponse.Data as UserDetails),
      );
    } else {
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/home',
        ModalRoute.withName('/home'),
      );
      showToastMsg("invalid Login State!");
    }
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
        itemBuilder: (context, index) {
          final catalog = items[index];
          return InkWell(
            child: CatalogItem(catalog: catalog),
            //  onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeDetailPage(catalog: catalog,))),
          );
        });
  }
}

class CatalogItem extends StatelessWidget {
  final CatalogModel catalog;

  const CatalogItem({Key key, @required this.catalog})
      : assert(catalog != null),
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
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.title.text.lg.color(Color(0xff403b58)).bold.make(),
            catalog.type.text
                .textStyle(context.captionStyle)
                .color(Color(0xff403b58))
                .make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${catalog.price}".text.xl.bold.make(),
                AddToCart(catalog: catalog),
              ],
            ).pOnly(right: 8.0)
          ],
        ))
      ],
    )).color(Colors.white).roundedLg.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;

  const CatalogImage({Key key, @required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
    ).box.rounded.p8.color(context.canvasColor).make().p16().w40(context);
  }
}

class AddToCart extends StatelessWidget {
  final CatalogModel catalog;
  AddToCart({
    Key key,
    this.catalog,
  }) : super(key: key);

  //bool isInCart = false;
  // final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    // VxState.watch(context, on: [AddMutation, RemoveMutation]);

    // final CartModel _cart = (VxState.store as MyStore).cart;
    //  final CatalogModel _catalog = (VxState.store as MyStore).catalog;

    //bool isInCart = _cart.items.contains(catalog)?? false;

    return ElevatedButton(
      // onPressed: (){
      //   if(!isInCart) {
      //     // isInCart = isInCart.toggle();
      //     // final _catalog = CatalogModel();
      //
      //     // _cart.catalog = _catalog;
      //
      //   //  AddMutation(catalog);
      //     // _cart.add(catalog);
      //     // setState(() {});
      //   }
      // },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Vx.indigo500,
        ),
        shape: MaterialStateProperty.all(
          StadiumBorder(),
        ),
      ),
      child: "Add to Cart".text.make(),
    );
  }
}
