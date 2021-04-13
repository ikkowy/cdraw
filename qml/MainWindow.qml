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
    minimumWidth: 640
    minimumHeight: 480
    visible: true
    title: "Chicken Draw"
    visibility: "Maximized"
    color: Style.colorGenericBackground

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
        width: hidden ? 0 : 300
        height: parent.height - ribbon.height - statusbar.height
        anchors.bottom: parent.bottom
        anchors.bottomMargin: statusbar.height
        color: Style.colorSidebarBackground

        property bool hidden: false
    }

    Rectangle {
        width: parent.width - sidebar.width
        height: parent.height - ribbon.height - statusbar.height
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: statusbar.height
        color: Style.colorGenericBackground
    }

    Rectangle {
        id: statusbar
        width: parent.width
        height: 20
        anchors.bottom: parent.bottom
        color: Style.colorStatusbarBackground
    }

    Item {
        focus: true
        Keys.onPressed: {
            if ((event.key == Qt.Key_B) && (event.modifiers & Qt.ControlModifier)) {
                sidebar.hidden = !sidebar.hidden;
            } else if ((event.key == Qt.Key_R) && (event.modifiers & Qt.ControlModifier)) {
                ribbon.minimized = !ribbon.minimized;
            }
        }
    }
}
