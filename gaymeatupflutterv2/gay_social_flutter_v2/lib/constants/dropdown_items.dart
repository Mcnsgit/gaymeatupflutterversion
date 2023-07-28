import 'package:flutter/material.dart';

class DropdownItems {
  static const List<DropdownMenuItem<String>> position = [
    DropdownMenuItem<String>(
      value: '',
      child: Text('Any'),
    ),
    DropdownMenuItem<String>(
        value: 'Top',
        child: Text('Top'),
      ),
      DropdownMenuItem<String>(
        value: 'Top Vers',
        child: Text('Top Vers'),
      ),
      DropdownMenuItem<String>(
        value: 'Vers',
        child: Text('Vers'),
      ),
      DropdownMenuItem<String>(
        value: 'Side',
        child: Text('Side'),
      ),
      DropdownMenuItem<String>(
        value: 'Bottom Vers',
        child: Text('Bottom Vers'),
      ),
      DropdownMenuItem<String>(
        value: 'Bottom',
        child: Text('Bottom'),
      ),
    ]; 
  }
  const List<DropdownMenuItem<String>> lookingFor = [
    DropdownMenuItem<String>(
      value: '',
      child: Text('Any'),
    ),
    DropdownMenuItem<String>(
        value: 'Now Host',
        child: Text('Now Host'),
      ),
      DropdownMenuItem<String>(
        value: 'Cruising',
        child: Text('Cruising'),
      ),
      DropdownMenuItem<String>(
        value: 'Car',
        child: Text('Car'),
      ),
      DropdownMenuItem<String>(
        value: 'Chat',
        child: Text('Chat'),
      ),
      DropdownMenuItem<String>(
        value: 'Cam',
        child: Text('Cam'),
      ),
    ];
  }
  void _openFilterDrawer() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 350,
          padding: const EdgeInsets.all(10),
          child:  Column(
            children:  <Widget>[ 
                const Text( 
                'Filter Settings',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                'Age Range:',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              RangeSlider(
                values: _currentAgeRange,
                min: 18,
                max: 75,
                divisions: 57,
                labels: RangeLabels(
                  _currentAgeRange.start.round().toString(),
                  _currentAgeRange.end.round().toString(),
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentAgeRange = values;
                  });
                },
              ),
              const SizedBox(height: 18),
              const Text(
                'Position:',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              DropdownButton<String>(
                value: _currentPosition,
                items: _getPositionDropdownItems(),
                onChanged: (String? value) {
                  setState(() {
                    _currentPosition = value ?? '';
                  });
                },
              ),
              const SizedBox(height: 18),
              const Text(
                'Looking For:',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              DropdownButton<String>(
                value: _currentLookingFor,
                items: _getLookingForDropdownItems(),
                onChanged: (String? value) {
                  setState(() {
                    _currentLookingFor = value ?? '';
                  });
                },
              ),
              const SizedBox(height: 18),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Apply Filters'),
              ),
            ],
          ),
        );
      },
    );
  }