import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Grid Layout Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Custom Grid Layout'),
        ),
        body: CustomGridViewLayout(),
      ),
    );
  }
}

class CustomGridViewLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int crossAxisCount = 4;
    int totalRows = 6;
    double gridSpacing = 6; // Khoảng cách giữa các items và padding
    double gridWidth = MediaQuery.of(context).size.width;
    double tileWidth = (gridWidth - (crossAxisCount + 1) * gridSpacing) / crossAxisCount;
    double tileHeight = tileWidth;
    double stackHeight = totalRows * tileHeight + (totalRows + 1 ) * gridSpacing;

    List<Widget> gridTiles = [
      buildGridTile(Colors.green, Icons.window, 1, 1, 2, 2, tileWidth, tileHeight, gridSpacing),
      buildGridTile(Colors.orange, Icons.send, 1, 3, 2, 2, tileWidth, tileHeight, gridSpacing),
      buildGridTile(Colors.blue, Icons.wifi, 3, 1, 2, 1, tileWidth, tileHeight, gridSpacing),
      buildGridTile(Colors.yellow, Icons.chat, 3, 2, 1, 2, tileWidth, tileHeight, gridSpacing),
      buildGridTile(Colors.brown, Icons.map, 4, 2, 1, 1, tileWidth, tileHeight, gridSpacing),
      buildGridTile(Colors.red, Icons.bluetooth, 3, 4, 1, 1, tileWidth, tileHeight, gridSpacing),
      buildGridTile(Colors.purple, Icons.tv, 4, 5, 1, 1, tileWidth, tileHeight, gridSpacing),
      buildGridTile(Colors.indigo, Icons.bed, 4, 3, 1, 2, tileWidth, tileHeight, gridSpacing),
      buildGridTile(Colors.pink, Icons.battery_alert_outlined, 1, 5, 3,1 , tileWidth, tileHeight, gridSpacing),
      buildGridTile(Colors.blue, Icons.radio, 1, 6, 4,1 , tileWidth, tileHeight, gridSpacing),


    ];

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: gridSpacing),
        child: Container(
          width: gridWidth,
          height: stackHeight,
          child: Stack(
            children: gridTiles,
          ),
        ),
      ),
    );
  }

  Widget buildGridTile(Color color, IconData icon, int col, int row, int colSpan, int rowSpan, double tileWidth, double tileHeight, double gridSpacing) {
    double adjustedTileWidth = tileWidth * colSpan + gridSpacing * (colSpan - 1);
    double adjustedTileHeight = tileHeight * rowSpan + gridSpacing * (rowSpan - 1);
    double left = (col - 1) * tileWidth + col * gridSpacing;
    double top = (row - 1) * tileHeight + row * gridSpacing;

    return Positioned(
      left: left,
      top: top,
      child: Container(
        width: adjustedTileWidth,
        height: adjustedTileHeight,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Icon(
          icon,
          size: 32,
          color: Colors.white,
        ),
      ),
    );
  }
}
