import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:santos_pandesal_app/components/shop-tile.dart';
import 'package:santos_pandesal_app/models/product.dart';
import 'package:santos_pandesal_app/providers/navigation-provider.dart';
import 'package:santos_pandesal_app/utils/colors.dart';

class ShopPage extends StatefulWidget {

  ShopPage({super.key,});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // String _selectedCategory = 'breads';
  bool _breadContainer = true;
  bool _spreadContainer = true;
  bool _drinksContainer = true;
  bool _searching = false;

  List<Product> allProducts = [];
  List<Product> searchList = [];

  TextEditingController _searchController = TextEditingController();
  

  @override
  void initState() {
    allProducts.addAll(breadList);
    allProducts.addAll(spreadList);
    super.initState();
    _searchController.addListener(searchStatus);
  }

  void searchStatus(){
   setState(() {
      _searching = _searchController.text.isNotEmpty;
    });
    updateSearchProducts();
  }

  void updateSearchProducts() {
    String searchQuery = _searchController.text.toLowerCase();
    if (searchQuery.isEmpty) {
      setState(() {
        searchList.clear(); // Clear search results if the query is empty
      });
    } else {
      setState(() {
        searchList = allProducts
            .where((product) =>
                product.name.toLowerCase().contains(searchQuery))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String _activeContainer = Provider.of<BottomNavigationProvider>(context, listen: false).activeContainer;
    if(_activeContainer == 'breads'){
      setState(() {
        _breadContainer = true;
        _spreadContainer = false;
        _drinksContainer = false;
      });
    }
    else if(_activeContainer == 'spreads'){
      setState(() {
        _breadContainer = false;
        _spreadContainer = true;
        _drinksContainer = false;
      });
    }
    else if(_activeContainer == 'drinks'){
      setState(() {
        _breadContainer = false;
        _spreadContainer = false;
        _drinksContainer = true;
      });
    }
    
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            const SizedBox(height: 20,),
            Text(
              'PRODUCTS',
              style: TextStyle(
                color: AppColors.color3,
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      maxLines: 1,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: 'Search a product...',
                        
                        filled: true,
                        fillColor: Colors.grey[300],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none
                        ),
                      )
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            !_searching ? Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.breadSlice,
                            color: AppColors.color3,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'BREADS',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: AppColors.color3,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: (){
                              setState(() {
                                _breadContainer = !_breadContainer;
                              });
                            }, 
                            icon: Icon(
                              _breadContainer ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                              size: 30,
                              color: AppColors.color3,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: _breadContainer ? ProductsBuilder(
                        productList: breadList,
                      )
                      : Container(),
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.jar,
                            color: AppColors.color3,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'SPREADS',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: AppColors.color3,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: (){
                              setState(() {
                                _spreadContainer = !_spreadContainer;
                              });
                            }, 
                            icon: Icon(
                              _spreadContainer ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                              size: 30,
                              color: AppColors.color3,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: _spreadContainer ? ProductsBuilder(
                        productList: spreadList,
                      )
                      : Container(),
                    ),
                    Container(
                      child: Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.jar,
                            color: AppColors.color3,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'DRINKS',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: AppColors.color3,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: (){
                              setState(() {
                                _drinksContainer = !_drinksContainer;
                              });
                            }, 
                            icon: Icon(
                              _drinksContainer ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                              size: 30,
                              color: AppColors.color3,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: _drinksContainer
                        ? Center(
                            child: Text(
                              'COMING SOON',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: AppColors.color3,
                              ),
                            ),
                          )
                        : Container(),
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ):
            Expanded(
              child: searchList.length != 0 ? SingleChildScrollView(
                child: ProductsBuilder(
                  productList: searchList,
                )
              ) : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.breadSlice,
                      size: 100,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'No Products found',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
          ]
        ),
      ),
    );
  }
}

class ProductsBuilder extends StatelessWidget {
  final List productList;
  ProductsBuilder({
    super.key, required this.productList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: productList.length,
      itemBuilder: (context, index){
        var _product = productList[index];
        return ShopTile(product: _product);
      }
    );
  }
}

