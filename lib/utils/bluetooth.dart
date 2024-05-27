class InputHandler {
  static final InputHandler _instance = InputHandler._internal();

  factory InputHandler() {
    return _instance;
  }

  InputHandler._internal();

  double? xValue = 0.0;
  double? yValue = 0.0;

  setJoystickData(double inputXValue, double inputYValue) {
    xValue = inputXValue;
    yValue = inputYValue;
  }

  List getJoystickData() {
    return [xValue, yValue];
  }
}