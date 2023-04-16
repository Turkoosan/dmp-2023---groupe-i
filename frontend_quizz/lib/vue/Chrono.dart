import 'dart:async';
import 'package:flutter/material.dart';

class Chrono extends StatefulWidget {
  @override
  _ChronoState createState() => _ChronoState();
}

class _ChronoState extends State<Chrono> {
  late int _selectedTime;
  late int _remainingTime;
  late bool _timerRunning;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _selectedTime = 30;
    _remainingTime = _selectedTime;
    _timerRunning = false;
  }

  void _startTimer() {
    _timerRunning = true;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer.cancel();
          _timerRunning = false;
          // Do something when time is up
        }
      });
    });
  }

  void _stopTimer() {
    _timer.cancel();
    _timerRunning = false;
    setState(() {
      _remainingTime = _selectedTime;
    });
  }

  void _showTimeDialog() async {
    int? selectedTime = await showDialog<int>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Select Time"),
        content: Container(
          height: 100,
          child: Center(
            child: DropdownButton<int>(
              value: _selectedTime,
              onChanged: (int? value) {
                setState(() {
                  _selectedTime = value!;
                });
              },
              items: List.generate(
                10,
                    (index) => DropdownMenuItem<int>(
                  value: (index + 1) * 10,
                  child: Text("${(index + 1) * 10} seconds"),
                ),
              ),
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.of(context).pop(_selectedTime);
            },
          ),
        ],
      ),
    );
    if (selectedTime != null) {
      setState(() {
        _selectedTime = selectedTime;
        _remainingTime = _selectedTime;
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("Remaining Time: $_remainingTime"),
        SizedBox(height: 16),
        ElevatedButton(
          child: Text(_timerRunning ? "Stop Timer" : "Start Timer"),
          onPressed: () {
            if (_timerRunning) {
              _stopTimer();
            } else {
              _startTimer();
            }
          },
        ),
        SizedBox(height: 16),
        ElevatedButton(
          child: Text("Select Time"),
          onPressed: () {
            _showTimeDialog();
          },
        ),
      ],
    );
  }
}
