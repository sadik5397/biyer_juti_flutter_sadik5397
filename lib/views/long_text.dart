import 'package:biyer_juti/component/bread_crumb.dart';
import 'package:flutter/material.dart';

import '../component/app_bar.dart';
import '../theme/gap.dart';
import '../theme/padding.dart';

class LongText extends StatelessWidget {
  const LongText({Key? key, required this.pageName}) : super(key: key);
  final String pageName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ThemeAppBar.primary(),
        body: ListView(padding: ThemePadding.p4, children: [
          BreadCrumb(["Biyer Juti", pageName]),
          Padding(
              padding: ThemePadding.p4.copyWith(top: ThemePadding.value * 2),
              child: const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque malesuada elit nisl. Donec nec magna pharetra, consequat elit vel, mattis felis. Nullam semper nisi eget est sagittis "
                  "fermentum. Maecenas tincidunt condimentum ex ut efficitur. Donec efficitur nulla eros, at mollis ex fermentum at. Suspendisse potenti. Nunc nec ex malesuada, gravida elit quis, luctus "
                  "neque. Donec viverra orci in cursus viverra. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Fusce dapibus dui ut orci luctus fermentum. "
                  "Suspendisse hendrerit id arcu a finibus. Quisque mi lectus, dignissim vitae sagittis in, consequat sed lectus. Etiam libero lacus, efficitur ac diam at, egestas malesuada lacus.\n\n"
                  "Donec id pellentesque sapien, vitae posuere augue. Sed id congue mauris. Cras ultrices a quam a mollis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis"
                  " egestas. Aenean vitae nisi vel turpis auctor luctus. Donec lectus metus, imperdiet quis lacus vel, aliquam porta justo. Donec dignissim neque in ullamcorper pellentesque. In id dictum"
                  " mauris, in sollicitudin nisi. Suspendisse semper luctus lacus, et iaculis nulla aliquam non. Vivamus et justo vel quam euismod vulputate at quis quam. Aliquam sit amet lacinia elit, "
                  "ac posuere arcu. Aenean varius nisi eget nisl sollicitudin commodo. Sed varius eleifend mauris in ornare. Morbi tristique, eros eu hendrerit pharetra, mauris justo eleifend tellus, "
                  "varius molestie libero ligula id eros. Vivamus efficitur nibh commodo libero suscipit, vel elementum diam egestas.\n\n"
                  "Nullam ex turpis, pulvinar quis volutpat id, commodo dignissim erat. Quisque vehicula faucibus molestie. Etiam nibh risus, rutrum sed dignissim et, volutpat vel tellus. Nunc molestie\n\n"
                  "sodales elementum. Aliquam erat volutpat. Curabitur non placerat justo. Quisque rutrum ante lectus",
                  textAlign: TextAlign.justify)),
          Gap.gy6,
          Gap.gy6,
        ]));
  }
}
