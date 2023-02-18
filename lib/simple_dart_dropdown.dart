import 'package:simple_dart_modal_controller/simple_dart_modal_controller.dart';
import 'package:simple_dart_ui_core/simple_dart_ui_core.dart';

class Dropdown extends PanelComponent {
  bool onTop = false;
  double shading = 0.2;

  Panel dropPanel = Panel()
    ..vertical = true
    ..addCssClass('DropdownDropPanel');

  Dropdown() : super('Dropdown') {
    element.onClick.listen((event) {
      showDropPanel();
    });
  }

  void showDropPanel() {
    beforeShowDropPanel();
    if (onTop) {
      final bottom = element.client.bottom + element.offset.height;
      final left = element.offsetLeft;
      modalController.showModal(dropPanel, shading: shading, left: '${left}px', bottom: '${bottom}px');
      return;
    }
    final top = element.offsetTop + element.offsetHeight;
    final left = element.offsetLeft;
    modalController.showModal(dropPanel, shading: shading, left: '${left}px', top: '${top}px');
  }

  void beforeShowDropPanel() {}

  @override
  void reRender() {
    super.reRender();
    dropPanel.reRender();
  }
}
