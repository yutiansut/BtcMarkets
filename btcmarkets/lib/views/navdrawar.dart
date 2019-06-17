import 'package:btcmarkets/models/navview.dart';
import 'package:btcmarkets/providers/appdataprovider.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatefulWidget {
  NavDrawer();



  @override
  _NavDrawerState createState() => _NavDrawerState();

}

//ListTile.divideTiles(
class _NavDrawerState extends State<NavDrawer>
{

  final bool hasValidAccount = false;

  void _onSelectMenu(View view, SubView subView)
  {
    var nav = new NavView();
    nav.view = view;
    nav.subView = subView;
    var model = AppDataProvider.of(context).model;
    model.switchView(nav);
    
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return new Drawer(
        child: new ListView(
            padding: EdgeInsets.zero,
            children:
             <Widget>[
               new Container(
                height: 150,
                child: new DrawerHeader(
                  child: new Text("DRAWER HEADER.."),
                  decoration: new BoxDecoration(
                      color: Theme.of(context).accentColor
                  ),
                 // margin: EdgeInsets.all(0.0),
                  //padding: EdgeInsets.all(0.0),
                ),
                ),
                ListTile(leading: Icon(Icons.home), title: Text('Home'), onTap: ()=> _onSelectMenu(View.Home,SubView.None), ),
                new Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.swap_vert), title: Text('Favourite Markets'), onTap: ()=> _onSelectMenu(View.Markets,SubView.MarketFavourites)),
                  new Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.swap_vert), title: Text('AUD Markets'), onTap: ()=> _onSelectMenu(View.Markets,SubView.MarketAudMarkets)),
                  new Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.swap_vert), title: Text('BTC Markets'), onTap: ()=> _onSelectMenu(View.Markets,SubView.MarketBtcMarkets)),
                  new Divider(height: 1),

                   ListTile(
                  leading: Icon(Icons.swap_vert), title: Text('Trades'), onTap: ()=> _onSelectMenu(View.Trades,SubView.None)),
           
              //   ListTile(
              //       leading: Icon(Icons.favorite), title: Text('Favourites'), trailing: Icon(Icons.arrow_forward_ios),),
              //  new Divider(height: 1),
              //   ListTile(
              //       leading: Icon(Icons.show_chart), title: Text('BTC Markets'), trailing: Icon(Icons.arrow_forward_ios),),
              //  new Divider(height: 1),
              //   ListTile(
              //     leading: Icon(Icons.show_chart), title: Text('AUD Markets'), trailing: Icon(Icons.arrow_forward_ios),),
              //  new Divider(height: 1),
              //   ListTile(
              //       leading: Icon(Icons.swap_vert), title: Text('Market Trades'), trailing: Icon(Icons.arrow_forward_ios),),
               new Divider(height: 1),
                ListTile(
                    leading: Icon(Icons.attach_money), title: Text('Balances'), enabled: hasValidAccount, onTap: ()=> _onSelectMenu(View.Account,SubView.AccountBalances)),
               new Divider(height: 1),
                ListTile(leading: Icon(Icons.format_list_bulleted),
                    title: Text('Open Orders'), enabled: hasValidAccount, onTap: ()=> _onSelectMenu(View.Account,SubView.AccountOpenOrders)),
               new Divider(height: 1),
                ListTile(leading: Icon(Icons.view_list),
                    title: Text('Orders History'), enabled: hasValidAccount, onTap: ()=> _onSelectMenu(View.Account,SubView.AccountOrderHistory)),
               new Divider(height: 1),
                ListTile(leading: Icon(Icons.monetization_on),
                    title: Text('Funds History'), enabled: hasValidAccount, onTap: ()=> _onSelectMenu(View.Account,SubView.AccountFundHistory)),
               new Divider(height: 1),
                ListTile(leading: Icon(Icons.settings), title: Text('Settings'), onTap: ()=> _onSelectMenu(View.Settings,SubView.None)),
               new Divider(height: 1),
                ListTile(leading: Icon(Icons.view_list), title: Text('News'), onTap: ()=> _onSelectMenu(View.News,SubView.None)),
               new Divider(height: 1),
                ListTile(leading: Icon(Icons.info), title: Text('About'), onTap: ()=> _onSelectMenu(View.About,SubView.None)),
               new Divider(height: 1),
              ],

        ) //end listview
    ); //end Drawar
  }
}