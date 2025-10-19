import QtQuick
import QtQuick.Window

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Text {
        text: "Привет, мир!"
        anchors.centerIn: parent      // центрируем по родителю (окну)
        font.pointSize: 24           // размер шрифта
        color: "black"               // цвет текста
    }
}
