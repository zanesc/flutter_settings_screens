import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

class AppSettings extends StatefulWidget {
  @override
  _AppSettingsState createState() => _AppSettingsState();
}

class _AppSettingsState extends State<AppSettings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SettingsScreen(
        title: "Application Settings",
        children: [
          SettingsGroup(
            title: 'Single Choice Settings',
            children: <Widget>[
              SwitchSettingsTile(
                settingKey: 'key-wifi',
                title: 'Wi-Fi',
                subtitle: 'Wi-Fi allows interacting with the local network '
                    'or internet via connecting to a W-Fi router',
                enabledLabel: 'Enabled',
                color: Colors.green,
                disabledLabel: 'Disabled',
                leading: Icon(Icons.wifi),
                onChange: (value) {
                  debugPrint('key-wifi: $value');
                },
              ),
              CheckboxSettingsTile(
                settingKey: 'key-blue-tooth',
                title: 'Bluetooth',
                subtitle: 'Bluetooth allows interacting with the '
                    'near by bluetooth enabled devices',
                enabledLabel: 'Enabled',
                color: Colors.green,
                disabledLabel: 'Disabled',
                leading: Icon(Icons.bluetooth),
                onChange: (value) {
                  debugPrint('key-blue-tooth: $value');
                },
              ),
              SwitchSettingsTile(
                leading: Icon(Icons.developer_mode),
                settingKey: 'key-switch-dev-mode',
                title: 'Developer Settings',
                color: Colors.green,
                onChange: (value) {
                  debugPrint('key-switch-dev-mod: $value');
                },
                childrenIfEnabled: <Widget>[
                  CheckboxSettingsTile(
                    leading: Icon(Icons.adb),
                    settingKey: 'key-is-developer',
                    title: 'Developer Mode',
                    color: Colors.green,
                    onChange: (value) {
                      debugPrint('key-is-developer: $value');
                    },
                  ),
                  SwitchSettingsTile(
                    leading: Icon(Icons.usb),
                    settingKey: 'key-is-usb-debugging',
                    title: 'USB Debugging',
                    color: Colors.green,
                    onChange: (value) {
                      debugPrint('key-is-usb-debugging: $value');
                    },
                  ),
                  SimpleSettingsTile(
                    title: 'Root Settings',
                    subtitle: 'These setting is not accessible',
                    enabled: false,
                    color: Colors.green,
                  ),
                  SimpleSettingsTile(
                    title: 'Custom Settings',
                    color: Colors.green,
                    subtitle: 'Tap to execute custom callback',
                    onTap: () => debugPrint('Snackbar action'),
                  ),
                ],
              ),
              SimpleSettingsTile(
                title: 'More Settings',
                subtitle: 'General App Settings',
                color: Colors.green,
                child: SettingsScreen(
                  title: "App Settings",
                  children: <Widget>[
                    CheckboxSettingsTile(
                      leading: Icon(Icons.adb),
                      settingKey: 'key-is-developer',
                      color: Colors.green,
                      title: 'Developer Mode',
                      onChange: (bool value) {
                        debugPrint('Developer Mode ${value ? 'on' : 'off'}');
                      },
                    ),
                    SwitchSettingsTile(
                      leading: Icon(Icons.usb),
                      settingKey: 'key-is-usb-debugging',
                      color: Colors.green,
                      title: 'USB Debugging',
                      onChange: (value) {
                        debugPrint('USB Debugging: $value');
                      },
                    ),
                  ],
                ),
              ),
              TextInputSettingsTile(
                title: 'User Name',
                settingKey: 'key-user-name',
                initialValue: 'admin',
                validator: (String username) {
                  if (username != null && username.length > 3) {
                    return null;
                  }
                  return "User Name can't be smaller than 4 letters";
                },
                borderColor: Colors.blueAccent,
                errorColor: Colors.deepOrangeAccent,
              ),
              TextInputSettingsTile(
                title: 'password',
                settingKey: 'key-user-password',
                obscureText: true,
                validator: (String password) {
                  if (password != null && password.length > 6) {
                    return null;
                  }
                  return "Password can't be smaller than 7 letters";
                },
                borderColor: Colors.blueAccent,
                errorColor: Colors.deepOrangeAccent,
              ),
              ModalSettingsTile(
                title: 'Quick setting dialog',
                subtitle: 'Settings on a dialog',
                color: Colors.green,
                children: <Widget>[
                  CheckboxSettingsTile(
                    settingKey: 'key-day-light-savings',
                    title: 'Daylight Time Saving',
                    enabledLabel: 'Enabled',
                    color: Colors.green,
                    disabledLabel: 'Disabled',
                    leading: Icon(Icons.timelapse),
                    onChange: (value) {
                      debugPrint('key-day-light-saving: $value');
                    },
                  ),
                  SwitchSettingsTile(
                    settingKey: 'key-dark-mode',
                    title: 'Dark Mode',
                    enabledLabel: 'Enabled',
                    color: Colors.green,
                    disabledLabel: 'Disabled',
                    leading: Icon(Icons.palette),
                    onChange: (value) {
                      debugPrint('jey-dark-mode: $value');
                    },
                  ),
                ],
              ),
              ExpandableSettingsTile(
                title: 'Quick setting 2',
                subtitle: 'Expandable Settings',
                color: Colors.green,
                children: <Widget>[
                  CheckboxSettingsTile(
                    settingKey: 'key-day-light-savings-2',
                    title: 'Daylight Time Saving',
                    enabledLabel: 'Enabled',
                    disabledLabel: 'Disabled',
                    color: Colors.green,
                    leading: Icon(Icons.timelapse),
                    onChange: (value) {
                      debugPrint('key-day-light-savings-2: $value');
                    },
                  ),
                  SwitchSettingsTile(
                    settingKey: 'key-dark-mode-2',
                    title: 'Dark Mode',
                    enabledLabel: 'Enabled',
                    color: Colors.green,
                    disabledLabel: 'Disabled',
                    leading: Icon(Icons.palette),
                    onChange: (value) {
                      debugPrint('key-dark-mode-2: $value');
                    },
                  ),
                ],
              ),
            ],
          ),
          SettingsGroup(
            title: 'Multiple choice settings',
            children: <Widget>[
              RadioSettingsTile<int>(
                title: 'Preferred Sync Period',
                color: Colors.green,
                settingKey: 'key-radio-sync-period',
                values: <int, String>{
                  0: 'Never',
                  1: 'Daily',
                  7: 'Weekly',
                  15: 'Fortnight',
                  30: 'Monthly',
                },
                selected: 0,
                onChange: (value) {
                  debugPrint('key-radio-sync-period: $value');
                },
              ),
              DropDownSettingsTile<int>(
                title: 'E-Mail View',
                color: Colors.green,
                settingKey: 'key-dropdown-email-view',
                values: <int, String>{
                  2: 'Simple',
                  3: 'Adjusted',
                  4: 'Normal',
                  5: 'Compact',
                  6: 'Squizzed',
                },
                selected: 2,
                onChange: (value) {
                  debugPrint('key-dropdown-email-view: $value');
                },
              ),
            ],
          ),
          ModalSettingsTile(
            title: 'Group Settings',
            color: Colors.green,
            subtitle: 'Same group settings but in a dialog',
            children: <Widget>[
              SimpleRadioSettingsTile(
                title: 'Sync Settings',
                color: Colors.green,
                settingKey: 'key-radio-sync-settings',
                values: <String>[
                  'Never',
                  'Daily',
                  'Weekly',
                  'Fortnight',
                  'Monthly',
                ],
                selected: 'Daily',
                onChange: (value) {
                  debugPrint('key-radio-sync-settins: $value');
                },
              ),
              SimpleDropDownSettingsTile(
                title: 'Beauty Filter',
                color: Colors.green,
                settingKey: 'key-dropdown-beauty-filter',
                values: <String>[
                  'Simple',
                  'Normal',
                  'Little Special',
                  'Special',
                  'Extra Special',
                  'Bizzar',
                  'Horrific',
                ],
                selected: 'Special',
                onChange: (value) {
                  debugPrint('key-dropdown-beauty-filter: $value');
                },
              )
            ],
          ),
          ExpandableSettingsTile(
            title: 'Expandable Group Settings',
            color: Colors.green,
            subtitle: 'Group of settings (expandable)',
            children: <Widget>[
              RadioSettingsTile<double>(
                title: 'Beauty Filter',
                color: Colors.green,
                settingKey: 'key-radio-beauty-filter-exapndable',
                values: <double, String>{
                  1.0: 'Simple',
                  1.5: 'Normal',
                  2.0: 'Little Special',
                  2.5: 'Special',
                  3.0: 'Extra Special',
                  3.5: 'Bizzar',
                  4.0: 'Horrific',
                },
                selected: 2.5,
                onChange: (value) {
                  debugPrint('key-radio-beauty-filter-expandable: $value');
                },
              ),
              DropDownSettingsTile<int>(
                title: 'Preferred Sync Period',
                color: Colors.green,
                settingKey: 'key-dropdown-sync-period-2',
                values: <int, String>{
                  0: 'Never',
                  1: 'Daily',
                  7: 'Weekly',
                  15: 'Fortnight',
                  30: 'Monthly',
                },
                selected: 0,
                onChange: (value) {
                  debugPrint('key-dropdown-sync-period-2: $value');
                },
              )
            ],
          ),
          SettingsGroup(
            title: 'Other settings',
            children: <Widget>[
              SliderSettingsTile(
                title: 'Volume',
                color: Colors.green,
                settingKey: 'key-slider-volume',
                defaultValue: 20,
                min: 0,
                max: 100,
                step: 5,
                leading: Icon(Icons.volume_up),
                onChange: (value) {
                  debugPrint('key-slider-volume: $value');
                },
              ),
              ColorPickerSettingsTile(
                settingKey: 'key-color-picker',
                title: 'Accent Color',
                defaultValue: Colors.blue,
                color: Colors.green,
                onChange: (value) {
                  debugPrint('key-color-picker: $value');
                },
              )
            ],
          ),
          ModalSettingsTile(
            title: 'Other settings',
            subtitle: 'Other Settings in a Dialog',
            color: Colors.green,
            children: <Widget>[
              SliderSettingsTile(
                title: 'Custom Ratio',
                settingKey: 'key-custom-ratio-slider-2',
                defaultValue: 2.5,
                color: Colors.green,
                min: 1,
                max: 5,
                step: 0.1,
                leading: Icon(Icons.aspect_ratio),
                onChange: (value) {
                  debugPrint('key-custom-ratio-slider-2: $value');
                },
              ),
              ColorPickerSettingsTile(
                settingKey: 'key-color-picker-2',
                title: 'Accent Picker',
                defaultValue: Colors.blue,
                onChange: (value) {
                  debugPrint('key-color-picker-2: $value');
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
