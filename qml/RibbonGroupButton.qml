/* Copyright 2021 Vincent Westenberg
 * This file is part of Chicken Draw.
 *
 * Chicken Draw is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Chicken Draw is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Chicken Draw.  If not, see <http://www.gnu.org/licenses/>.
 */

import QtQuick 2.0

Rectangle {
    objectName: "RibbonGroupButton"
    width: label.width + 20
    height: 20
    color: active ? Style.colorForeground : Style.colorBackground

    property var ribbon
    property var group
    property bool active: false

    Text {
        id: label
        anchors.centerIn: parent
        color: active ? Style.colorText : Style.colorTextInactive
    }

    MouseArea {
        anchors.fill: parent
        onClicked: { ribbon.selectGroup(group); }
        onDoubleClicked: { if (active) { ribbon.minimized = !ribbon.minimized; } }
    }

    onGroupChanged: {
        label.text = group.name;
    }
}
