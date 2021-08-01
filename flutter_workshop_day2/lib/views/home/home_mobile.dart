part of home_view;

class _HomeMobile extends StatelessWidget {
  final HomeViewModel viewModel;

  _HomeMobile(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(left: 10, right: 10, top: 30),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('files').snapshots(),
            builder: (BuildContext context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: CircularProgressIndicator(),
                );
              return snapshot.data.docs.length > 0
                  ? StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              snapshot.data.docs[index].data()['url'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text('No Images'),
                    );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            viewModel.navigateToAddImage(context);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

// Navigator.push();