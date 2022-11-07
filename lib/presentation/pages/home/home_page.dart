part of '../pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = HomeController();
    return WillPopScope(
      onWillPop: () async {
        return Navigator.canPop(context);
      },
      child: Scaffold(
        appBar: _appBar(context,
            infoApps: homeController.onTapinfoApp,
            contact: homeController.onTapContact),
        body: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(top: 8),
          children: [
            _header(context),
            _recommend(),
            const SizedBox(height: 40),
            _games()
          ],
        ),
      ),
    );
  }

  Column _header(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Muyufar',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: colorPrimary, fontSize: 28),
          ),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(16, 16, 16, 28),
          decoration:
              inputBoxDecorationRounded.copyWith(color: Colors.grey.shade300),
          child: TextField(
            readOnly: true,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MorePage()),
              );
            },
            decoration: inputInputDecorationRounded.copyWith(
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 0.0, style: BorderStyle.none),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(width: 0.0, style: BorderStyle.none),
                borderRadius: BorderRadius.circular(10.0),
              ),
              prefixIcon: const Icon(
                Icons.search_rounded,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }

  AppBar _appBar(BuildContext context,
      {required Function infoApps, required Function contact}) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: Icon(
        Icons.gamepad_rounded,
        color: colorPrimary,
      ),
      actions: [
        PopupMenuButton(
            icon: const Icon(
              Icons.menu_rounded,
              color: Colors.black,
            ),
            onSelected: (value) {
              switch (value) {
                case '1':
                  infoApps(context);
                  break;
                case '2':
                  contact(context);
                  break;
                case '3':
                  if (Platform.isAndroid) {
                    SystemNavigator.pop();
                  } else {
                    exit(0);
                  }
                  break;
                default:
              }
            },
            itemBuilder: (context) => [
                  PopupMenuItem(
                      value: '1',
                      child: Text(
                        'Info Apps',
                        style: TextStyle(color: colorTextBlack),
                      )),
                  PopupMenuItem(
                      value: '2',
                      child: Text(
                        'Contact',
                        style: TextStyle(color: colorTextBlack),
                      )),
                  PopupMenuItem(
                      value: '3',
                      child: Text(
                        'Exit',
                        style: TextStyle(color: colorTextBlack),
                      )),
                ]),
      ],
    );
  }

  Widget _games() {
    return FutureBuilder(
      future: ProductServiceLocal.get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ProductModel> product = snapshot.data as List<ProductModel>;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Games',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: colorPrimary,
                          fontSize: 20),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MorePage()),
                        );
                      },
                      child: SizedBox(
                        width: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Show all',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.grey,
                              size: 16,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: product.length > 10 ? 10 : product.length,
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
                          // color: colorPrimary,
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
              )
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget _recommend() {
    return FutureBuilder(
      future: ProductServiceLocal.get(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ProductModel> product = snapshot.data as List<ProductModel>;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recommend',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: colorPrimary,
                          fontSize: 20),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MorePage()));
                      },
                      child: SizedBox(
                        width: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Show all',
                              style: TextStyle(color: Colors.grey),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.grey,
                              size: 16,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 180,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: product.length > 5 ? 5 : product.length,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) =>
                      CardBannerProductUtil(product: product[index]),
                ),
              )
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
