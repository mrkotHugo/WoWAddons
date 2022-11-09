# Dominos Changelog

## 10.0.4

* The Dominos Masque skin is now packaged as a separate addon (thanks [StormFX](https://github.com/StormFX))
* Adjusted bindings header definitions in retail to avoid tainting issues

## 10.0.3

* Fix possess bar errors in classic

## 10.0.2

* Fix missing Bindings.xml errors
* Fix some errors with hiding frames

## 10.0.1

* Use LibUIDropdown to reduce potential sources of taint from configuration mode
* (Clssic) Reimplement :HOTKEY bindings to ensure that cast on keypress works
  properly with modifier keys
* Update zhCN localization (thanks Kuletco)

## 10.0.0

* Improved show empty buttons detection for battlepet, mount, and petaction cursor types

### Known Issues

* Action bars do not support spell flyout actions on 10.x realms (Blizzard bug).
  You will receive an error if you try to use one.
* Not all action bars support cast on key press on 10.x realms (Blizzard bug)
* Not all action bars support hold to cast on 10.x realms (Blizzard bug)

## 10.0.0-beta4

* Fix error when leaving combat

## 10.0.0-beta3

* Fix bindings not showing up for action buttons in classic
* Fix invalid event registration preventing the possess bar from loading in vanilla
* Work around dragging mounts not triggering showing empty buttons by showing empty buttons when the collections journal
  is shown

## 10.0.0-beta2

* Re-enable action button reuse in classic versions
* Re-enable cast on keypress in classic versions
* Potentially add support for dragonriding
* Reduce some potential source of taint

## 10.0.0-beta1

* Added a placeholder for Dominos Encounter/Extras to automatically disable it

## 10.0.0-alpha4

* Added a new possess bar implementation that handles both possess and vehicle
  exit actions

## 10.0.0-alpha3

* Added a new pet bar implementation
* Added a queue status bar
* Added support for Warrior stances
* Reorganized menu buttons (thanks Daenarys)
* Turned the extra bar back on (it *probably* works without any additional adjustments needed)

## 10.0.0-alpha2

* Action button proxying implemented. Action Bars 1, 3, 4, 5, 6, 13, and 14 now
  support cast on key press and hold to cast
* Fixed shield conditionals for Paladins/Warriors

## 10.0.0-alpha1

* Dragonflight Support
* Added support for 14 action bars
* Merged Dominos_Encounter/Extras into the main addon
