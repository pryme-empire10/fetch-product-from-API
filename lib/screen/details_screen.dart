import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productapi/constants/colors.dart';
import 'package:productapi/model/product_model.dart';
import 'package:productapi/provider/product.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key});

  late ProductModel product;

  @override
  Widget build(BuildContext context) {
    final selectedProduct = Provider.of<ProductProvider>(context);
    final product = selectedProduct.selectedProduct();
    final height = MediaQuery.of(context).size.height / 2;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.kBlackColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.kContainerColor,
          ),
        ),
        title: Text(
          'Details Screen',
          style: GoogleFonts.poppins(
            color: AppColors.kContainerColor,
          ),
        ),
      ),
      body: ListView(
        children: [
          Hero(
            tag: product.imageUrl,
            child: SizedBox(
              width: width,
              height: height,
              child: CachedNetworkImage(
                imageUrl: product.imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => const SizedBox(
                    height: 10,
                    child: Center(
                      child: CircularProgressIndicator(),
                    )),
                errorWidget: (context, url, error) => Image.asset(
                  'assets/images/errorimage.jpeg',
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10,bottom: 10,top: 10,right: 10),
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
                const SizedBox(height: 20),
                Text(
                  '\$${product.price.toString()}',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Rating: ${product.rating.toString()}',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Description: ${product.description}',
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Brand: ${product.brand}',
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Category: ${product.category}',
                  style: GoogleFonts.poppins(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
