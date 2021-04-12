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
    height: minimized ? groups.height + bottomBorderHeight : 80
    color: Style.colorBackground

    property bool minimized: false

    property int bottomBorderHeight: 1

    Row {
        id: groups
        width: ribbon.width
        height: 20
    }

    Rectangle {
        width: ribbon.width
        height: ribbon.height - groups.height - bottomBorderHeight
        anchors.bottom: ribbon.bottom
        anchors.bottomMargin: bottomBorderHeight
        color: Style.colorForeground
    }

    Rectangle {
        width: ribbon.width
        height: bottomBorderHeight
        anchors.bottom: ribbon.bottom
        color: Style.colorBorder
    }

    Component.onCompleted: {
        const RibbonGroupButton = Qt.createComponent("RibbonGroupButton.qml");
        for (var i=0; i < children.length; i++) {
            var child = children[i];
            if (child.objectName === "RibbonGroup") {
                RibbonGroupButton.createObject(groups, {ribbon: ribbon, group: child});
            }
        }
    }

    function selectGroup(group) {
        for (var i=0; i < groups.children.length; i++) {
            var child = groups.children[i];
            if (child.objectName === "RibbonGroupButton") {
                child.active = child.group === group;
            }
        }
    }
}
