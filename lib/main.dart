import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:productapi/provider/product.dart';
import 'package:productapi/provider/product_fetcher.dart';
import 'package:provider/provider.dart';

import 'screen/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  DefaultCacheManager manager = DefaultCacheManager();
  manager.emptyCache();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductFetcher(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
