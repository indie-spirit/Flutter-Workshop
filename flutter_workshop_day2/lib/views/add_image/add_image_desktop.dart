part of add_image_view;

class _AddImageDesktop extends StatelessWidget {
  final AddImageViewModel viewModel;

  _AddImageDesktop(this.viewModel);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 20, right: 20),
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: _size.height * 0.4,
              width: _size.width * 0.5,
              child: Image.asset(
                "assets/placeholder.png",
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
                child: Text('Upload'),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Description',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {},
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                child: Text('Add'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
