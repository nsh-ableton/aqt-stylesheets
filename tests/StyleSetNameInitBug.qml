import QtQuick 2.3
import QtQuick.Controls 1.0

import Aqt.StyleSheets 1.1

ApplicationWindow {
    id: root

    StyleEngine {
        styleSheetSource: 'debug.css'
    }

    property var b: Item {
        id: b
        StyleSet.name: "b"

        property var bb: Item {
            id: bb
            StyleSet.name: "bb"
            height: StyleSet.props.number("height")

            Component.onCompleted: console.log("bb [Comp] ", StyleSet.path)
            StyleSet.onPathChanged: console.log("bb ", path)
            StyleSet.onNameChanged: console.log("bb [name]", StyleSet.path)
        }

        Component.onCompleted: console.log("b [Comp] ", StyleSet.path, " -> ", StyleSet.name)
        StyleSet.onPathChanged: console.log("b ", path)
        StyleSet.onNameChanged: console.log("b [name]", StyleSet.path, " -> ", StyleSet.name)
    }

    Component.onCompleted: console.log("A")
}
