import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nahar/View/Screen/ProductList/product_list_controller.dart';
class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  //=====================get api========================

  final controller = Get.put(ProductListController());
  @override
  void initState() {
    super.initState();
    controller.getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductListController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.black12,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.green,
            title: Text(
              'All Product List',
              style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.w700,
                color: Color(0xffFFFFFF),
              ),
            ),
            actions: [
              IconButton(onPressed:(){}, icon:Icon(Icons.notifications_active,color:Color(0xffFFFFFF),))
            ],
          ),
          body: Visibility(
            visible: controller.loading == false,
            replacement: Center(child: CircularProgressIndicator()),
            child: Column(
              children: [
                //====================this is Search bar text field============================
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (value) {
                      controller.searchProduct(value);
                    },
                    decoration: InputDecoration(
                      hintText: "Search by title",
                      suffixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      filled: true,
                     // fillColor: Colors.cyan,
                    ),
                  ),
                ),
                ///================== product list gridView===========================
                Expanded(
                  child: GridView.builder(
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemCount: controller.filteredList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing:8,
                      mainAxisSpacing:8,
                      childAspectRatio:0.48,
                    ),
                    itemBuilder: (context, index) {
                      final product = controller.filteredList[index];
                      return Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal:7.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height:90.h,
                                  width: double.maxFinite,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                   // color: Colors.black12,
                                    image: DecorationImage(
                                      image: NetworkImage(product.image??""),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                //===============================ExpansionTile//////////////////////////////
                                SizedBox(
                                    child: ExpansionTile(
                                      title:Text(
                                        'id:${product.id}',
                                        style: TextStyle(
                                          fontSize:13.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Title:${product.title}',
                                            style: TextStyle(
                                              fontSize:13.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'Price:${product.price}',
                                            style: TextStyle(
                                              fontSize:13.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'Description:${product.description}',
                                            style: TextStyle(
                                              fontSize:13.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            'Category:${product.category}',
                                            style: TextStyle(
                                              fontSize:13.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      //===========================dropdown ==========================
                                      children: [
                                        Container(
                                          height:40.h,
                                          width: double.maxFinite,
                                          color: Colors.white70,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              IconButton(onPressed:(){}, icon:Icon(Icons.edit,color:Colors.green,)),
                                              IconButton(
                                                onPressed: () {
                                                },
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: Colors.redAccent,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
         //================================ add ===================button====================
          floatingActionButton: FloatingActionButton(
            onPressed: () {
            },
            child: Text('Add'),
          ),
        );
      },
    );
  }
}
