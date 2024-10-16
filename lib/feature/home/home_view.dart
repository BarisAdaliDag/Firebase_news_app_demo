import 'package:firebase_news_app/core/kartal/kartal_extension.dart';
import 'package:firebase_news_app/product/constants/color_constants.dart';
import 'package:firebase_news_app/product/constants/string_constants.dart';
import 'package:firebase_news_app/product/widgets/text/sub_title_text.dart';
import 'package:firebase_news_app/product/widgets/text/title_text.dart';
import 'package:flutter/material.dart';

import 'package:firebase_news_app/product/models/tag.dart';

import 'package:firebase_news_app/product/enums/index.dart';
part './sub_view/home_chips.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: context.paddingNormal,
          child: ListView(
            children: const [
              _Header(),
              _CustomField(),
              _TabListView(),
              _BrowseHorizontalListView(),
              _RecomendedHeader(),
              _RecomendedListView(),
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomField extends StatelessWidget {
  const _CustomField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 56,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search_outlined),
          suffixIcon: Icon(Icons.mic_outlined),
          border: OutlineInputBorder(borderSide: BorderSide.none),
          filled: true,
          fillColor: ColorConstants.grayLighter,
          hintText: StringConstants.homeSearchHint,
        ),
      ),
    );
  }
}

class _TabListView extends StatelessWidget {
  const _TabListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.1),
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Chip(
            label: Text('item $index'),
            padding: context.paddingLow,
            backgroundColor: ColorConstants.purplePrimary,
          );
        },
      ),
    );
  }
}

class _BrowseHorizontalListView extends StatelessWidget {
  const _BrowseHorizontalListView({
    super.key,
  });
  final dummyImage =
      'https://firebasestorage.googleapis.com/v0/b/fir-news-app-652cc.appspot.com/o/white_house.png?alt=media&token=239cf0b8-3675-443a-a53e-998ebafe8b73';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.3),
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return _HorizontalCard(dummyImage: dummyImage);
        },
      ),
    );
  }
}

class _HorizontalCard extends StatelessWidget {
  const _HorizontalCard({
    required this.dummyImage,
    super.key,
  });

  final String dummyImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: context.onlyRightPaddingNormal,
          child: Image.network(
            dummyImage,
            errorBuilder: (context, error, stack) {
              return const Placeholder();
            },
          ),
        ),
        Positioned.fill(
          child: Padding(
            padding: context.paddingLow,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.bookmark_outline,
                    color: ColorConstants.white,
                    size: WidgetSize.iconNormal.value.toDouble(),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: context.paddingNormal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SubTitleText(
                        value: 'Politics',
                        color: ColorConstants.white,
                      ),
                      Text(
                        'Lates sitiuation in the presidential election',
                        style: context.textTheme.headlineSmall?.copyWith(color: ColorConstants.grayLighter),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _RecomendedHeader extends StatelessWidget {
  const _RecomendedHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(child: TitleText(value: StringConstants.homeTitle)),
        TextButton(onPressed: () {}, child: const SubTitleText(value: StringConstants.homeSeeAll)),
      ],
    );
  }
}

class _RecomendedListView extends StatelessWidget {
  const _RecomendedListView({
    super.key,
  });
  final dummyImage = 'https://picsum.photos/200';
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(), // birden fazla scroll ust uste birlikte calismasini saglar
      itemBuilder: (context, index) {
        return Padding(
          padding: context.onlyTopPaddingLow,
          child: Row(
            children: [
              Image.network(
                dummyImage,
                height: ImageSizes.normal.value.toDouble(),
                errorBuilder: (context, error, stack) {
                  return const Placeholder();
                },
              ),
              const Expanded(
                child: ListTile(
                  minLeadingWidth: 96,
                  title: Text('Politics'),
                  subtitle: Text('Lates sitiuation in the presidential election'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleText(value: StringConstants.homeBrowse),
        Padding(
          padding: context.onlyTopPaddingLow,
          child: const SubTitleText(value: StringConstants.homeMessage),
        ),
      ],
    );
  }
}
