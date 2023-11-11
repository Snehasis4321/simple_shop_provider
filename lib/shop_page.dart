import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_shop_provider/providers/cost_provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  List items = [
    {"name": "Electronics", "cost": 10000, "isAdded": false},
    {"name": "Clothes", "cost": 2000, "isAdded": false},
    {"name": "Foods", "cost": 3000, "isAdded": false},
    {"name": "Books", "cost": 2500, "isAdded": false},
    {"name": "Shoes", "cost": 750, "isAdded": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Shop",
        style: TextStyle(fontWeight: FontWeight.w600),
      )),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Text(items[index]["name"]),
            subtitle: Text("₹ ${items[index]["cost"]}"),
            trailing: items[index]["isAdded"]
                ? IconButton(
                    onPressed: () {
                      Provider.of<CostProvider>(context, listen: false)
                          .removeItem(items[index]["cost"]);
                      setState(() {
                        items[index]["isAdded"] = false;
                      });
                    },
                    icon: Icon(Icons.check_box))
                : IconButton(
                    onPressed: () {
                      Provider.of<CostProvider>(context, listen: false)
                          .addItem(items[index]["cost"]);
                      setState(() {
                        items[index]["isAdded"] = true;
                      });
                    },
                    icon: Icon(Icons.check_box_outline_blank)),
          ),
        ),
      ),
      bottomNavigationBar: Consumer<CostProvider>(
        builder: (context, value, child) => value.getTotalCost == 0
            ? SizedBox()
            : Container(
                margin: EdgeInsets.all(8),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                      "Your Total Cost for ${value.getTotalItems} ${value.getTotalItems == 1 ? "item" : "items"} is ₹ ${value.getTotalCost}"),
                ),
              ),
      ),
    );
  }
}
