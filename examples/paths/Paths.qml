import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.1

import Aqt.StyleSheets 1.1

import Gaz 1.0


ApplicationWindow {
    width: 500
    height: 410

    StyleEngine {
        id: styleEngine
        styleSheetSource: "style.css"
    }

    Quux {
        id: foox
    }
}
