part of '../pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.gamepad_rounded,
          color: colorPrimary,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu_rounded,
                color: Colors.black,
              ))
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
        children: [
          Text(
            'Muyufar',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: colorPrimary, fontSize: 28),
          ),
          Container(
            margin: const EdgeInsets.only(top: 16, bottom: 28),
            decoration:
                inputBoxDecorationRounded.copyWith(color: Colors.grey.shade300),
            child: TextField(
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
          _recommend(),
          const SizedBox(height: 40),
          _games()
        ],
      ),
    );
  }

  Row _games() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Games',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: colorPrimary, fontSize: 20),
        ),
        SizedBox(
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
        )
      ],
    );
  }

  Widget _recommend() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recommend',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: colorPrimary,
                  fontSize: 20),
            ),
            SizedBox(
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
            )
          ],
        ),
        SizedBox(
          height: 180,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                height: 180,
                width: 350,
                color: Colors.transparent,
                child: Stack(
                  children: [
                    Container(
                      height: 180,
                      width: 350,
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(top: 40),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 16,
                                spreadRadius: -4)
                          ]),
                      child: Row(
                        children: [
                          const SizedBox(width: 120),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Tuyul Man',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: colorPrimary,
                                    fontSize: 16),
                              ),
                              const Spacer(),
                              Text(
                                'Horro',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: colorTextBlack,
                                    fontSize: 12),
                              ),
                              const Spacer(),
                              Text(
                                'Game hantu indonesia, paling seram',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: colorTextBlack,
                                    fontSize: 12),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 180,
                      width: 120,
                      margin: const EdgeInsets.only(left: 8, bottom: 8),
                      decoration: BoxDecoration(
                        color: colorPrimary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
