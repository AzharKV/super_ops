import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // HttpService httpService = HttpService();
    // httpService.get("http://message-list.ap.com/messages?limit=1");
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0) + const EdgeInsets.only(top: 8.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(left: 24.0),
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32),
                      borderSide: BorderSide.none),
                  fillColor: const Color(0xFFF5F5F5),
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.black.withOpacity(0.5)),
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: ListView.separated(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        side: BorderSide(
                          width: 0.2,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                      elevation: 0.0,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0) +
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Row(
                          children: [
                            Container(
                              height: 50.0,
                              width: 50.0,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "http://message-list.appspot.com/photos/william-shakespeare.jpg"))),
                            ),
                            const SizedBox(width: 12.0),
                            Expanded(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "William Shakespeare",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text("7 years"),
                                ],
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.favorite,
                                      color: Colors.red),
                                ),
                                OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                        width: 2.0, color: Colors.red),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16.0)),
                                  ),
                                  child: const Text(
                                    "Delete",
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 16.0);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
