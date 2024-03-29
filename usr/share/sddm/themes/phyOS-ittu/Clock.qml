/*
 *   Copyright 2016 David Edmundson <davidedmundson@kde.org>
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU Library General Public License as
 *   published by the Free Software Foundation; either version 2 or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details
 *
 *   You should have received a copy of the GNU Library General Public
 *   License along with this program; if not, write to the
 *   Free Software Foundation, Inc.,
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

import QtQuick 2.0
import QtQuick.Layouts 1.1

import org.kde.plasma.core 2.0
import org.kde.plasma.components 2.0
import QtGraphicalEffects 1.0

ColumnLayout {
    Label {
        id: label_title
        text: Qt.formatTime(timeSource.data["Local"]["DateTime"])
        font.pointSize: 40 //Mockup says this, I'm not sure what to do?
        Layout.alignment: Qt.AlignHCenter
    }
    Label {
        id: label_sub
        text: Qt.formatDate(timeSource.data["Local"]["DateTime"], Qt.DefaultLocaleLongDate)
        font.pointSize: 20
        Layout.alignment: Qt.AlignHCenter
    }
    DropShadow {
        anchors.fill: label_title
        source: label_title
        verticalOffset: 2
        color: "#0000ff"
        radius: 3
        samples: 6
        }
    DropShadow {
        anchors.fill: label_sub
        source: label_sub
        verticalOffset: 2
        color: "#000000"
        radius: 3
        samples: 6
    }
    
    DataSource {
        id: timeSource
        engine: "time"
        connectedSources: ["Local"]
        interval: 1000
    }
}
