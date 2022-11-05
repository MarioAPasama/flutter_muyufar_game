part of '../pages.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: FutureBuilder(
        future: ProductServiceLocal.get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<ProductModel> product = snapshot.data as List<ProductModel>;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: product.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              GameWebViewPage(product[index].linkGame)),
                    );
                  },
                  leading: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: colorPrimary,
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: NetworkImage(product[index].cover))),
                  ),
                  title: Text(
                    product[index].name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: colorTextBlack,
                        fontSize: 14),
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Container(
        decoration:
            inputBoxDecorationRounded.copyWith(color: Colors.grey.shade300),
        child: TextField(
          decoration: inputInputDecorationRounded.copyWith(
            border: OutlineInputBorder(
              borderSide: const BorderSide(width: 0.0, style: BorderStyle.none),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 0.0, style: BorderStyle.none),
              borderRadius: BorderRadius.circular(10.0),
            ),
            prefixIcon: const Icon(
              Icons.search_rounded,
              color: Colors.grey,
            ),
          ),
        ),
      ),
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          color: colorPrimary,
        ),
      ),
    );
  }
}
