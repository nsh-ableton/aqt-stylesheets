import QtQuick 2.3
import Aqt.StyleSheets 1.1

Foo {
    property var moo: "hello"

    Component.onCompleted: console.log(bar.StyleSet.path)
}
