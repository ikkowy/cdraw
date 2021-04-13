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

import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: mainWindow
    width: 800
    height: 600
    visible: true
    title: "Chicken Draw"

    Ribbon {
        id: ribbon

        RibbonGroup {
            id: ribbonGroupHome
            name: "Home"
        }

        RibbonGroup { name: "Insert" }

        RibbonGroup { name: "Help" }

        Component.onCompleted: { selectGroup(ribbonGroupHome); }
    }

    Rectangle {
        id: sidebar
        width: 200
        height: parent.height - ribbon.height
        anchors.bottom: parent.bottom
        color: Style.colorSidebarBackground

        Rectangle {
            width: 5
            height: parent.height
            anchors.right: parent.right
            color: Style.colorSidebarHandle

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.SplitHCursor
                onPositionChanged: {
                    var width = sidebar.width + mouseX;
                    sidebar.width = Math.min(Math.max(width, parent.width), mainWindow.width);
                }
            }
        }
    }

    Rectangle {
        width: parent.width - sidebar.width
        height: parent.height - ribbon.height
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        color: "yellow"
    }
}
