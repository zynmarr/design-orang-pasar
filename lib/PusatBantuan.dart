import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PusatBantuan extends StatefulWidget {
  @override
  _PusatBantuanState createState() => _PusatBantuanState();
}

class _PusatBantuanState extends State<PusatBantuan> {
  final TextStyle _textStyle = TextStyle(fontWeight: FontWeight.w400, fontSize: 15,);
  final Color color1 = Colors.purple[300];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(15),
                child: Text(
                  'Pusat Bantuan',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.business_center_rounded,
                        size: 26,
                        color: color1,
                      ),
                      title: Text("Cara Berjualan di Rates", style: _textStyle),
                      trailing: Icon(Icons.arrow_forward_ios, size: 15),
                    ),
                    ListTile(
                      leading: Icon(
                        FontAwesomeIcons.gem,
                        size: 26,
                        color: color1,
                      ),
                      title: Text("Member Premium", style: _textStyle),
                      trailing: Icon(Icons.arrow_forward_ios, size: 15),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.share,
                        size: 26,
                        color: color1,
                      ),
                      title: Text("Mempromosikan Produk ", style: _textStyle),
                      trailing: Icon(Icons.arrow_forward_ios, size: 15),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.add_shopping_cart,
                        size: 26,
                        color: color1,
                      ),
                      title: Text("Membuat Pesanan", style: _textStyle),
                      trailing: Icon(Icons.arrow_forward_ios, size: 15),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.account_balance,
                        size: 26,
                        color: color1,
                      ),
                      title: Text("Pembayaran ", style: _textStyle),
                      trailing: Icon(Icons.arrow_forward_ios, size: 15),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.location_pin,
                        size: 26,
                        color: color1,
                      ),
                      title: Text(
                        "Status Pesanan",
                        style: _textStyle,
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, size: 15),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.query_builder,
                        size: 26,
                        color: color1,
                      ),
                      title: Text("Pengiriman ", style: _textStyle),
                      trailing: Icon(Icons.arrow_forward_ios, size: 15),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.money,
                        size: 26,
                        color: color1,
                      ),
                      title: Text("Keuntungan & Penarikan Saldo",
                          style: _textStyle),
                      trailing: Icon(Icons.arrow_forward_ios, size: 15),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.electric_bike,
                        size: 26,
                        color: color1,
                      ),
                      title: Text("Pembatalan, Pengembalian dan Penukaran",
                          style: _textStyle),
                      trailing: Icon(Icons.arrow_forward_ios, size: 15),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.person,
                        size: 26,
                        color: color1,
                      ),
                      title: Text("Akun Saya", style: _textStyle),
                      trailing: Icon(Icons.arrow_forward_ios, size: 15),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.error,
                        size: 26,
                        color: color1,
                      ),
                      title:
                          Text("Promo, Pengumuman, Lainnya", style: _textStyle),
                      trailing: Icon(Icons.arrow_forward_ios, size: 15),
                    ),
                    Container(
                      height: 80,
                      child: Center(
                        child: Icon(Icons.upgrade),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
