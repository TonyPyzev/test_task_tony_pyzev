import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_task_tony_pyzev/data/models/photo.dart';
import 'package:test_task_tony_pyzev/presentation/screens/home/cubit/home_cubit.dart';
import 'package:test_task_tony_pyzev/presentation/screens/image/image_screen.dart';

class HomeScreen extends StatefulWidget {
  final HomeCubit cubit;

  const HomeScreen({
    super.key,
    required this.cubit,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_handleScrolling);
  }

  void _handleScrolling() {
    if (_scrollController.offset >=
        _scrollController.position.maxScrollExtent -
            _scrollController.position.maxScrollExtent * 0.25) {
      widget.cubit.loadMorePhotos();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return ListView.builder(
              padding: EdgeInsets.zero,
              controller: _scrollController,
              itemCount: state.photos.length,
              itemBuilder: (context, index) {
                return _imageTile(
                  photo: state.photos[index],
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _imageTile({required Photo photo}) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ImageScreen(photo: photo)),
        );
      },
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              photo.urls['small'],
              fit: BoxFit.fitWidth,
              colorBlendMode: BlendMode.darken,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  photo.userName,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                if (photo.description != null)
                  Text(
                    photo.description!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
