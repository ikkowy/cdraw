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
    id: ribbon
    width: parent.width
    height: 80
    color: Style.colorBackground

    Row {
        id: groups
        width: ribbon.width
        height: 20
    }

    Rectangle {
        width: ribbon.width
        height: ribbon.height - groups.height
        anchors.bottom: ribbon.bottom
        color: Style.colorForeground
    }

    Component.onCompleted: {
        const RibbonGroupButton = Qt.createComponent("RibbonGroupButton.qml");
        var first = true;
        for (var i=0; i < ribbon.children.length; i++) {
            var child = ribbon.children[i];
            if (child.objectName === "RibbonGroup") {
                var button = RibbonGroupButton.createObject(groups, {group: child});
                if (first) {
                    button.active = true;
                    first = false;
                }
            }
        }
    }
}
