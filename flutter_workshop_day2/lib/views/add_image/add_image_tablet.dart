part of add_image_view;

class _AddImageTablet extends StatelessWidget {
  final AddImageViewModel viewModel;

  _AddImageTablet (this.viewModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('AddImageTablet'),
      ),
    );
  }
}
