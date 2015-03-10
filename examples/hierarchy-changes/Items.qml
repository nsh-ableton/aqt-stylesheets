// Copyright (c) 2015 Ableton AG, Berlin
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1

import Aqt.StyleSheets 1.1

ApplicationWindow {
    StyleSet.name: "special"

    width: 500
    height: 410

    StyleEngine {
        id: styleEngine
        styleSheetSource: "style.css"
    }

    Flickable {
        id: box
        StyleSet.name: "flick"

        property var obj: Rectangle {
            StyleSet.name: "foo"
            property var value: StyleSet.props.get("text")

            StyleSet.onPathChanged: console.log("Path is now: ", path)
        }
    }

    Rectangle {
        id: p1
        StyleSet.name: "one"
        children: box.obj
    }

    Rectangle {
        id: p2
        StyleSet.name: "two"
    }

    Rectangle {
        StyleSet.name: "root"
        anchors.fill: parent

        Text {
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            text: box.obj.value ? box.obj.value : "N"
            font.pixelSize: 72
        }

        MouseArea {
            id: area1
            anchors.fill: parent

            onClicked: {
                if (p1.children.length >= 1) {
                    p1.children[0].parent = p2;
                }
                else {
                    p2.children[0].parent = p1;
                }
            }
        }
    }
}
