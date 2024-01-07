import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productapi/provider/product.dart';
import 'package:productapi/provider/product_fetcher.dart';
import 'package:productapi/screen/details_screen.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    Provider.of<ProductFetcher>(context,listen: false).getProductData();
  }

  @override
  Widget build(BuildContext context) {
    final selectedProduct = Provider.of<ProductProvider>(context);
    return Scaffold(
      backgroundColor: AppColors.kBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.kBlackColor,
        title: const Text(
          'All Products',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Consumer<ProductFetcher>(
        builder: (context, productFetcher, child) {
          return ListView.builder(
            itemCount: productFetcher.product.length,
            itemBuilder: (context, index) {
              final product = productFetcher.product[index];
              return GestureDetector(
                onTap: () {
                  selectedProduct.getDetails(product);
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailsScreen(),
                  ));
                },
                child: Container(
                  color: AppColors.kContainerColor,
                  margin: const EdgeInsets.only(
                      left: 5, top: 5, bottom: 5, right: 5),
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: product.imageUrl,
                        child: SizedBox(
                          height: 100,
                          width: 100,
                          child: CachedNetworkImage(
                            imageUrl: product.imageUrl,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Image.asset(
                              'assets/images/png.png',
                              fit: BoxFit.cover,
                            ),
                            errorWidget: (context, url, error) => Image.asset(
                              'assets/images/errorimage.jpeg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.title,
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              '\$${product.price.toString()}',
                              style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              product.rating.toString(),
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
