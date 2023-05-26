import 'package:crypto_ap/data/model/crypto_model.dart';
import 'package:flutter/material.dart';

class BuyScreen extends StatefulWidget {
  final CryptoModel cryptoModellist;
  const BuyScreen(this.cryptoModellist, {super.key});

  @override
  State<BuyScreen> createState() => _BuyScreenState();
}

class _BuyScreenState extends State<BuyScreen> {
  SampleItem? selectedMenu;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Icon(
            Icons.more_vert,
            size: 35,
            color: Color(0xff00203F),
          ),
        ],
        title: Text(
          widget.cryptoModellist.name!,
          style: const TextStyle(
            fontSize: 30,
            fontFamily: 'yb',
          ),
        ),
        elevation: 0,
        backgroundColor: const Color(0xffADEFD1),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xffADEFD1),
              Color(0xff00203F),
            ],
          ),
        ),
        child: DefaultTabController(
          length: 3,
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: Material(
                  color: Colors.transparent,
                  child: Theme(
                    data: ThemeData().copyWith(
                      splashColor: const Color(0xff00203F),
                    ),
                    child: const TabBar(
                      indicatorColor: Color(0xff00203F),
                      indicatorWeight: 5,
                      indicatorPadding: EdgeInsets.only(
                        bottom: 7,
                      ),
                      tabs: [
                        Text(
                          'buy',
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'yb',
                            color: Color(0xff00203F),
                          ),
                        ),
                        Text(
                          'sell',
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'yb',
                            color: Color(0xff00203F),
                          ),
                        ),
                        Text(
                          'transfer',
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: 'yb',
                            color: Color(0xff00203F),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 400,
                child: TabBarView(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 30,
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          widget.cryptoModellist.symbol!,
                                        ),
                                      ),
                                    ),
                                    PopupMenuButton<SampleItem>(
                                      initialValue: selectedMenu,
                                      // Callback that sets the selected popup menu item.
                                      onSelected: (SampleItem item) {
                                        setState(() {
                                          selectedMenu = item;
                                        });
                                      },
                                      itemBuilder: (BuildContext context) =>
                                          <PopupMenuEntry<SampleItem>>[
                                        const PopupMenuItem<SampleItem>(
                                          value: SampleItem.itemOne,
                                          child: Text('Item 1'),
                                        ),
                                        const PopupMenuItem<SampleItem>(
                                          value: SampleItem.itemTwo,
                                          child: Text('Item 2'),
                                        ),
                                        const PopupMenuItem<SampleItem>(
                                          value: SampleItem.itemThree,
                                          child: Text('Item 3'),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Text(
                                      ' \$ ${double.parse(widget.cryptoModellist.price!).toStringAsFixed(3)}',
                                      style: const TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          widget.cryptoModellist.symbol!,
                                        ),
                                      ),
                                    ),
                                    PopupMenuButton<SampleItem>(
                                      initialValue: selectedMenu,
                                      // Callback that sets the selected popup menu item.
                                      onSelected: (SampleItem item) {
                                        setState(() {
                                          selectedMenu = item;
                                        });
                                      },
                                      itemBuilder: (BuildContext context) =>
                                          <PopupMenuEntry<SampleItem>>[
                                        const PopupMenuItem<SampleItem>(
                                          value: SampleItem.itemOne,
                                          child: Text('Item 1'),
                                        ),
                                        const PopupMenuItem<SampleItem>(
                                          value: SampleItem.itemTwo,
                                          child: Text('Item 2'),
                                        ),
                                        const PopupMenuItem<SampleItem>(
                                          value: SampleItem.itemThree,
                                          child: Text('Item 3'),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Text(
                                      ' \$ ${double.parse(widget.cryptoModellist.price!).toStringAsFixed(3)}',
                                      style: const TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 25,
                                  horizontal: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xffADEFD1),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Buy Now',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: 'yb',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 30,
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          widget.cryptoModellist.symbol!,
                                        ),
                                      ),
                                    ),
                                    PopupMenuButton<SampleItem>(
                                      initialValue: selectedMenu,
                                      // Callback that sets the selected popup menu item.
                                      onSelected: (SampleItem item) {
                                        setState(() {
                                          selectedMenu = item;
                                        });
                                      },
                                      itemBuilder: (BuildContext context) =>
                                          <PopupMenuEntry<SampleItem>>[
                                        const PopupMenuItem<SampleItem>(
                                          value: SampleItem.itemOne,
                                          child: Text('Item 1'),
                                        ),
                                        const PopupMenuItem<SampleItem>(
                                          value: SampleItem.itemTwo,
                                          child: Text('Item 2'),
                                        ),
                                        const PopupMenuItem<SampleItem>(
                                          value: SampleItem.itemThree,
                                          child: Text('Item 3'),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Text(
                                      ' \$ ${double.parse(widget.cryptoModellist.price!).toStringAsFixed(3)}',
                                      style: const TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          widget.cryptoModellist.symbol!,
                                        ),
                                      ),
                                    ),
                                    PopupMenuButton<SampleItem>(
                                      initialValue: selectedMenu,
                                      // Callback that sets the selected popup menu item.
                                      onSelected: (SampleItem item) {
                                        setState(() {
                                          selectedMenu = item;
                                        });
                                      },
                                      itemBuilder: (BuildContext context) =>
                                          <PopupMenuEntry<SampleItem>>[
                                        const PopupMenuItem<SampleItem>(
                                          value: SampleItem.itemOne,
                                          child: Text('Item 1'),
                                        ),
                                        const PopupMenuItem<SampleItem>(
                                          value: SampleItem.itemTwo,
                                          child: Text('Item 2'),
                                        ),
                                        const PopupMenuItem<SampleItem>(
                                          value: SampleItem.itemThree,
                                          child: Text('Item 3'),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Text(
                                      ' \$ ${double.parse(widget.cryptoModellist.price!).toStringAsFixed(3)}',
                                      style: const TextStyle(
                                        fontSize: 35,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 25,
                                  horizontal: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xffADEFD1),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Sell Now',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: 'yb',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 30,
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'From:',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontFamily: 'yb',
                                      ),
                                    ),
                                    SizedBox(
                                      width: 250,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Wallet Address',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'To:',
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontFamily: 'yb',
                                      ),
                                    ),
                                    SizedBox(
                                      width: 250,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Wallet Address',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 25,
                                  horizontal: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xffADEFD1),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Transfer Now',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontFamily: 'yb',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Transaction History',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'yb',
                        color: Color(0xffADEFD1),
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        fontSize: 22,
                        fontFamily: 'yb',
                        color: Color(0xffADEFD1),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                ),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: const Icon(
                        Icons.outbond,
                        size: 34,
                        color: Color.fromARGB(255, 87, 84, 84),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'mehdi shamekhi',
                            style: TextStyle(
                              fontFamily: 'yb',
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'income',
                            style: TextStyle(
                              fontFamily: 'yb',
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '+12000 USDT',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          '22:22',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: const Icon(
                        Icons.outbond,
                        size: 34,
                        color: Color.fromARGB(255, 87, 84, 84),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'mehdi shamekhi',
                            style: TextStyle(
                              fontFamily: 'yb',
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'income',
                            style: TextStyle(
                              fontFamily: 'yb',
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '+55000 USDT',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          '7:53',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
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

enum SampleItem { itemOne, itemTwo, itemThree }
